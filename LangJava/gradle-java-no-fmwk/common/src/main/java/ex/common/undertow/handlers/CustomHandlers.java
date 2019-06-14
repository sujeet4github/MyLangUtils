package ex.common.undertow.handlers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import io.undertow.server.HttpHandler;

public class CustomHandlers {
    private static final Logger log = LoggerFactory.getLogger(CustomHandlers.class);

    public static TimingHttpHandler timed(String name, HttpHandler next) {
        return new TimingHttpHandler(next, "routes." + name);
    }
}
