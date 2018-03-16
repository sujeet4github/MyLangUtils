package t.drools.service;

import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import t.drools.model.Fact;
import t.drools.model.Result;

@Service
public class BackwardChainingService {

    @Autowired
    private KieContainer kContainer;

    public Result process() {

        KieSession kieSession = kContainer.newKieSession();

    	Result result = new Result();

        kieSession.setGlobal("result", result);
        kieSession.insert(new Fact("Asia", "Planet Earth"));
        kieSession.insert(new Fact("China", "Asia"));
        kieSession.insert(new Fact("Great Wall of China", "China"));

        kieSession.fireAllRules();
        kieSession.dispose();

        return result;
    }
}