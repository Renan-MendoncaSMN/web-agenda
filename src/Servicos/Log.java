package Servicos;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

public class Log {

    private static String caminhoLog = "C:\\temp";

    public static void write(String message) {
        try
        {
            BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(caminhoLog + System.getProperty("file.separator") + "log.txt", true));
            bufferedWriter.write("\r\n" + new Date().toString() + " - " + message);
            bufferedWriter.close();
        }
        catch(IOException ex)
        {
            System.out.println("Erro ao tentar gravar log: " + ex.getMessage());
        }
    }
}