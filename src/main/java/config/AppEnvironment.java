package config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class AppEnvironment {
    //server
    @Value("${server.servlet.context-path}")
    public String CONTEXT_PATH;
    @Value("${server.port}")
    public  int PORT;

    //DB
    @Value("${spring.datasource.url}")
    public  String MSSQL_URL;
    @Value("${spring.datasource.driver-class-name}")
    public  String SQL_DRIVER_CLASS_NAME;
    @Value("${spring.datasource.username}")
    public  String DB_USERNAME;
    @Value("${spring.datasource.password}")
    public  String DB_PASSWORD;

    //jwt
    @Value("${jwt.signerKey}")
    public  String SIGNER_KEY;
    @Value("${jwt.valid-duration}")
    public  int JWT_VALID_DURATION_AT;
    @Value("${jwt.refreshable-duration}")
    public  int JWT_VALID_DURATION_RT;

}
