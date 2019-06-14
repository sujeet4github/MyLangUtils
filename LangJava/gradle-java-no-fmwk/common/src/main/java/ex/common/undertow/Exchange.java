package ex.common.undertow;

import ex.undertow.exchange.ContentTypeSenders;

/*
 * Using static globals for simplicity. Use your own DI method however you want.
 */
public class Exchange {

	public static interface BodyImpl extends ContentTypeSenders, JsonSender, JsonParser, HtmlTemplateSender {
	};

	private static final BodyImpl BODY = new BodyImpl() {
	};

	public static BodyImpl body() {
		return BODY;
	}
}
