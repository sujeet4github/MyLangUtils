package ex.examples.undertow.accesslog;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ex.common.undertow.SimpleServer;
import ex.examples.undertow.routing.RoutingHandlers;
import ex.examples.undertow.routing.RoutingServer;
import ex.undertow.handlers.accesslog.Slf4jAccessLogReceiver;
import io.undertow.server.HttpHandler;
import io.undertow.server.RoutingHandler;
import io.undertow.server.handlers.accesslog.AccessLogHandler;

/**
 * https://www.stubbornjava.com/posts/http-access-logging-with-undertow
 * 
 * HTTP access logging has many uses, debugging, auditing, metrics, alarms and
 * many more. Undertow has a very extensible access logging handler where you
 * can customize whatever format you want and plug in your own logging framework
 * 
 * The default access log receiver is JBossLoggingAccessLogReceiver.java however
 * we will be using Slf4jAccessLogReceiver
 * 
 * @author ssukumaran
 *
 */
public class AccessLogServer {

	private static final Logger logger = LoggerFactory.getLogger(RoutingServer.class);

	// {{start:routes}}
	// copy paste routes from RoutingServer
	private static final HttpHandler ROUTES = new RoutingHandler()
			.get("/", RoutingHandlers.constantStringHandler("GET - My Homepage"))
			.get("/myRoute", RoutingHandlers.constantStringHandler("GET - My Route"))
			.post("/myRoute", RoutingHandlers.constantStringHandler("POST - My Route"))
			.get("/myOtherRoute", RoutingHandlers.constantStringHandler("GET - My Other Route"))
			.get("/myRoutePrefix*", RoutingHandlers.constantStringHandler("GET - My Prefixed Route"))
			// Pass a handler as a method reference.
			.setFallbackHandler(RoutingHandlers::notFoundHandler);
	// {{end:routes}}

	// {{start:accesslog}}
	//
	// The default access log receiver is JBossLoggingAccessLogReceiver.java however
	// we will be using Slf4jAccessLogReceiver
	//
	private static final HttpHandler ROOT = new AccessLogHandler(ROUTES,
			new Slf4jAccessLogReceiver(LoggerFactory.getLogger("ex.examples.undertow.accesslog")), "combined",
			AccessLogServer.class.getClassLoader());
	// {{end:accesslog}}

	// {{start:server}}
	public static void main(String[] args) {

		SimpleServer server = SimpleServer.simpleServer(ROOT);
		server.start();
	}
	// {{end:server}}
}