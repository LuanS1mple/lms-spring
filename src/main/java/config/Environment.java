package config;

import org.springframework.beans.factory.annotation.Value;

public class Environment {
    //server
    @Value("${server.servlet.context-path}")
    public static String CONTEXT_PATH;
    @Value("${server.port}")
    public static int PORT;

    //DB
    @Value("${spring.datasource.url}")
    public static String MSSQL_URL;
    @Value("${spring.datasource.driver-class-name}")
    public static String SQL_DRIVER_CLASS_NAME;
    @Value("${spring.datasource.username}")
    public static String DB_USERNAME;
    @Value("${spring.datasource.password}")
    public static String DB_PASSWORD;

    //jwt
    @Value("${jwt.signerKey}")
    public static String SIGNER_KEY;
    @Value("${jwt.valid-duration}")
    public static int JWT_VALID_DURATION_AT;
    @Value("${jwt.refreshable-duration}")
    public static int JWT_VALID_DURATION_RT;

    public static void main(String[] args) {
        System.out.println(CONTEXT_PATH);
    }
}
