package config;

import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

@Configuration
public class DBConfiguration {

    @Bean
    public DataSource dataSource(){
        return DataSourceBuilder.create()
                .url(Environment.MSSQL_URL)
                .username(Environment.DB_USERNAME)
                .password(Environment.DB_PASSWORD)
                .driverClassName(Environment.SQL_DRIVER_CLASS_NAME)
                .build();
    }
}
