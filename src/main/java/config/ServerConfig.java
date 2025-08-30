package config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.boot.web.servlet.server.ConfigurableServletWebServerFactory;
import org.springframework.stereotype.Component;

@Component
public class ServerConfig implements WebServerFactoryCustomizer<ConfigurableServletWebServerFactory> {
    @Autowired
    private AppEnvironment environment;
    @Override
    public void customize(ConfigurableServletWebServerFactory factory) {
        factory.setPort(environment.PORT);
        factory.setContextPath(environment.CONTEXT_PATH);
    }
}
