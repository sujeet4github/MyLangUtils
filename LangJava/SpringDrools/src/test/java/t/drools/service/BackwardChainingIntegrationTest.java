package t.drools.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import t.drools.service.AppConfiguration;
import t.drools.service.BackwardChainingService;
import t.drools.model.Fact;
import t.drools.model.Result;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = AppConfiguration.class)
public class BackwardChainingIntegrationTest {

    @Autowired
    private BackwardChainingService backwardChainingService;

    @Test
    public void whenWallOfChinaIsGiven_ThenItBelongsToPlanetEarth() {

        // Assert Decision one
        assertEquals(backwardChainingService.process().getValue(), "Decision one taken: Great Wall of China BELONGS TO Planet Earth");
    }
}