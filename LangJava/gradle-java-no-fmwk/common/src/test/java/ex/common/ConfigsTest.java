package ex.common;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertFalse;

import org.junit.Test;

import com.typesafe.config.Config;

public class ConfigsTest {

    @Test
    public void emptyConfigShouldNotFail() {
        new Configs.Builder().build();
    }

    @Test
    public void configShouldLoadResource() {
        Config conf = new Configs.Builder()
                                 .withResource("other.conf")
                                 .build();
        assertEquals("other", conf.getString("name"));
    }

    @Test
    public void checkConfigResourceOfTypePath() {
        Config conf = new Configs.Builder()
                                 .withResource("other.conf")
                                 .build();
        assertTrue(conf.hasPath("foo.bar"));
        assertFalse(conf.hasPath("foo1.bar1"));
    }
}