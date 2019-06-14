package ex.examples.undertow.routing;

import io.undertow.server.HttpHandler;
import io.undertow.server.HttpServerExchange;
import io.undertow.util.Headers;

/**
 * https://www.stubbornjava.com/posts/undertow-writing-custom-httphandlers
 *
 * HttpHandlers are the building blocks of Undertow.
 *
 * Option 1: Custom class implementing HttpHandler
 *  This is generally the best option when writing middleware / filtering HttpHandlers
 *  that delegate responsibility to other handlers or handlers with lots of code or
 *  complex logic.
 */
// {{start:handler}}
public class ConstantStringHandler implements HttpHandler {

    private final String value;

    public ConstantStringHandler(String value) {
        this.value = value;
    }

    @Override
    public void handleRequest(HttpServerExchange exchange) throws Exception {
        exchange.getResponseHeaders().put(Headers.CONTENT_TYPE, "text/plain");
        exchange.getResponseSender().send(value + "\n");
    }
}
// {{end:handler}}