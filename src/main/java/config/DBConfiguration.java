package config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

@Configuration
public class DBConfiguration {
    @Autowired
    private AppEnvironment environment;
    @Bean
    public DataSource dataSource(){
        return DataSourceBuilder.create()
                .url(environment.MSSQL_URL)
                .username(environment.DB_USERNAME)
                .password(environment.DB_PASSWORD)
                .driverClassName(environment.SQL_DRIVER_CLASS_NAME)
                .build();
    }
}
