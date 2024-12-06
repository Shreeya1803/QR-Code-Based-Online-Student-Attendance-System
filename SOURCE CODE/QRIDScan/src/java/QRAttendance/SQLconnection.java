
package QRAttendance;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Beast
 */
public class SQLconnection {
    
static Connection con;

    
    /**
     *
     * @return
     */
    public static Connection getconnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/qridscan", "root", "root");
        } catch (Exception e) {
        }
        return con;
    }
}
