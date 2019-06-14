package ex.common;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.collect.Maps;
import com.googlecode.htmlcompressor.compressor.HtmlCompressor;

//{{start:templating}}
public class Templating {

	private static final Logger log = LoggerFactory.getLogger(Templating.class);
	private static final Map<Object, Object> NO_DATA = Maps.newHashMapWithExpectedSize(0);

	// Once again using static for convenience use your own DI method.
	private static final Templating DEFAULT;
	static {
		DEFAULT = new Templating();
	}

	public static Templating instance() {
		return DEFAULT;
	}

    private final HtmlCompressor compressor = new HtmlCompressor();

	public String renderHtmlTemplate(String templateName) {
		return renderHtmlTemplate(templateName, NO_DATA);
	}

	public String renderHtmlTemplate(String templateName, Object data) {
		String response = renderTemplate(templateName, data);
		return compressor.compress(response);
	}

    public String renderRawHtmlTemplate(String rawTemplate) {
        return renderRawTemplate(rawTemplate, NO_DATA);
    }

    public String renderRawHtmlTemplate(String rawTemplate, Object data) {
        String response = renderRawTemplate(rawTemplate, data);
        return compressor.compress(response);
    }

    public String renderTemplate(String templateName) {
        return renderTemplate(templateName, NO_DATA);
    }

    public String renderTemplate(String templateName, Object data) {
    	// TODO implement this
    	return "";
    }
    
    public String renderRawTemplate(String rawTemplate) {
        return renderRawTemplate(rawTemplate, NO_DATA);
    }

    public String renderRawTemplate(String rawTemplate, Object data) {
    	// TODO implement this
    	return "";
    }


}
//{{end:templating}}
