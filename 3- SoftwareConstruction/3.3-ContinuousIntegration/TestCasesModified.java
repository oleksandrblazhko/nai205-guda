import java.sql.*;
import oracle.jdbc.driver.*;

class TestCasesModified {

    public static void main(final String[] args) {
        int testcaseResult = 0;
        try{
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
            Connection con = DriverManager.getConnection(
                    "jdbc:oracle:thin:@91.219.60.189:1521/XEPDB1",
                    args[0],
                    args[1]);

            CallableStatement cstmt1 = con.prepareCall("{? = call change_state(?,?)}");
            cstmt1.registerOutParameter(1,Types.NUMERIC);
            cstmt1.setString(2,"Sadness");
            cstmt1.setString(3,"snowflake");
            cstmt1.executeUpdate();
            System.out.print("TC1: change_state('Sadness','snowflake') очікуваний результат 1, результат:" + cstmt1.getInt(1));
            if(cstmt1.getInt(1) == 1) System.out.println("Passed");
            else{System.out.println("Failed");
                testcaseResult = -1;}


            cstmt1.setString(2,"Sadness");
            cstmt1.setString(3,"сновflake");
            cstmt1.executeUpdate();
            System.out.print("TC2: change_state('Sadness','сновflake') очікуваний результат -1, результат:" + cstmt1.getInt(1));
            if(cstmt1.getInt(1) == -1) System.out.println("Passed");
            else{System.out.println("Failed");
                testcaseResult = -1;}


            cstmt1.setString(2,"sadness");
            cstmt1.setString(3,"сновflake");
            cstmt1.executeUpdate();
            System.out.print("TC3: change_state('sadness','сновflake') очікуваний результат -1, результат:" + cstmt1.getInt(1));
            if(cstmt1.getInt(1) == -1) System.out.println("Passed");
            else{System.out.println("Failed");
                testcaseResult = -1;}


            cstmt1.setString(2,"sadness..................більше 2000 символів");
            cstmt1.setString(3,"snowflake");
            cstmt1.executeUpdate();
            System.out.print("TC4: change_state('текст повідомлення','+38062asdg525') очікуваний результат -1, результат:" + cstmt1.getInt(1));
            if(cstmt1.getInt(1) == -1) System.out.println("Passed");
            else{System.out.println("Failed");
                testcaseResult = -1;}


            cstmt1.setString(2,"sadness..................більше 2000 символів");
            cstmt1.setString(3,"snow");
            cstmt1.executeUpdate();
            System.out.print("TC5: change_state('sadness..................більше 2000 символів','snow') очікуваний результат -1, результат:" + cstmt1.getInt(1));
            if(cstmt1.getInt(1) == -1) System.out.println("Passed");
            else{System.out.println("Failed");
                testcaseResult = -1;}


            con.close();
        }
        catch(Exception e){System.out.println(e);}
        System.exit(testcaseResult);
    }
}
