import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;

// Quick 'n dirty converter from SQL to cypher
public class Main
{
    // Path of output file
    private static final String FILE_PATH = "cypher.txt";

    public static void main(String[] args)
    {
        Connection connnection = Connector.getConnection();

        if(connnection == null)
        {
            // exit
            return;
        }

        String sql = "SELECT * FROM ";
        String cypher_line = "";

        BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true));

        try
        {
            ResultSet resultSet = Connector.getQueryResult(connnection, sql);

            while (resultSet.next())
            {
                // Clear variable
                cypher_line = "";

                // Build a cypher line
                cypher_line += resultSet.getString("");

                /*
                ... to be continued ...
                */


                writer.append(cypher_line);
            }

            // Save File
            writer.close();
        }

        catch (Exception e)
        {
            e.printStackTrace();
            // Exit
            return;
        }

        // Close Connection
        Connector.closeConnection(connnection);

    }
}
