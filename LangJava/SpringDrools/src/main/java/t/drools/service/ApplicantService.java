package t.drools.service;

import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import t.drools.model.Applicant;
import t.drools.model.SuggestedRole;

@Service
public class ApplicantService {

    @Autowired
    private KieContainer kContainer;

    public SuggestedRole suggestARoleForApplicant(Applicant applicant,SuggestedRole suggestedRole) {

        KieSession kieSession = kContainer.newKieSession();

        kieSession.insert(applicant);
        kieSession.setGlobal("suggestedRole",suggestedRole);
        kieSession.fireAllRules();

        System.out.println(suggestedRole.getRole());

        return suggestedRole;
    }
}