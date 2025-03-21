using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Web;

public class QueryStringEncryptionHelper
{
    // AES requires:
    // - A 32-byte key (256-bit encryption)
    // - A 16-byte IV (128-bit encryption)
    private static readonly byte[] Key = Encoding.UTF8.GetBytes("A9dX7mZqP3sT6vN8rY5wL2bC0KjF4GQH"); // 32 bytes 
    private static readonly byte[] IV = Encoding.UTF8.GetBytes("X9vT7mZqL2bC6N8T"); // 16 bytes


    // Encrypt the query string
    public static string Encrypt(string plainText)
    {
        // Convert plain text to bytes
        byte[] plainBytes = Encoding.UTF8.GetBytes(plainText);

        using (Aes aes = Aes.Create())
        {
            aes.Key = Key;
            aes.IV = IV;
            aes.Padding = PaddingMode.PKCS7;

            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, aes.CreateEncryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(plainBytes, 0, plainBytes.Length);
                    cs.FlushFinalBlock();
                }

                // Convert encrypted bytes to Base64
                string base64Encrypted = Convert.ToBase64String(ms.ToArray());

                // Make Base64 URL-safe
                string safeBase64 = base64Encrypted.Replace("+", "-").Replace("/", "_").Replace("=", "");

                return safeBase64;
            }
        }
    }

    // Decrypt the query string
    public static string Decrypt(string encryptedText)
    {
        try
        {
            // Restore Base64 format
            string paddedBase64 = encryptedText.Replace("-", "+").Replace("_", "/");
            while (paddedBase64.Length % 4 != 0)
            {
                paddedBase64 += "=";
            }

            byte[] cipherBytes = Convert.FromBase64String(paddedBase64);

            using (Aes aes = Aes.Create())
            {
                aes.Key = Key;
                aes.IV = IV;
                aes.Padding = PaddingMode.PKCS7;

                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, aes.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.FlushFinalBlock();
                    }

                    return Encoding.UTF8.GetString(ms.ToArray());
                }
            }
        }
        catch (Exception e)
        {
            return "Decryption failed: " + e.Message;
        }
    }
}
