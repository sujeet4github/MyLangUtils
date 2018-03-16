package t.drools.config;

import org.drools.decisiontable.DecisionTableProviderImpl;
import org.kie.api.KieServices;
import org.kie.api.builder.*;
import org.kie.api.io.Resource;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;
import org.kie.internal.builder.DecisionTableConfiguration;
import org.kie.internal.builder.DecisionTableInputType;
import org.kie.internal.builder.KnowledgeBuilderFactory;
import org.kie.internal.io.ResourceFactory;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

// replaced by AppConfiguration class (Spring integration)
@Deprecated
public class DroolsBeanFactory {

    private static final String RULES_PATH = "t/drools/rules/";

    private KieServices kieServices=KieServices.Factory.get();

	// this is an in-memory file system provided by the framework.
    private KieFileSystem getKieFileSystem() throws IOException{

        KieFileSystem kieFileSystem = kieServices.newKieFileSystem();

        List<String> rules=Arrays.asList(
			"BackwardChaining.drl",
			"SuggestApplicant.drl",
			"Product_rules.xls");

        for(String filename:rules){
            kieFileSystem.write(
				ResourceFactory.newClassPathResource(
					RULES_PATH + filename));
        }
        return kieFileSystem;
    }

	// KieContainer which is a placeholder for all the KieBases for particular KieModule.
	// KieContainer is built with the help of other beans including KieFileSystem, KieModule, and KieBuilder.
	//
    public KieContainer getKieContainer() throws IOException {

        getKieRepository();

        KieBuilder kb = kieServices.newKieBuilder(getKieFileSystem());
        kb.buildAll();

        KieModule kieModule = kb.getKieModule();
        KieContainer kContainer = kieServices.newKieContainer(kieModule.getReleaseId());

        return kContainer;

    }

    private void getKieRepository() {
        final KieRepository kieRepository = kieServices.getRepository();
        kieRepository.addKieModule(new KieModule() {
			public ReleaseId getReleaseId() {
                return kieRepository.getDefaultReleaseId();
            }
        });
    }

    public KieSession getKieSession(){
        getKieRepository();
        KieFileSystem kieFileSystem = kieServices.newKieFileSystem();

        kieFileSystem.write(ResourceFactory.newClassPathResource("t/drools/rules/BackwardChaining.drl"));
        kieFileSystem.write(ResourceFactory.newClassPathResource("t/drools/rules/SuggestApplicant.drl"));
        kieFileSystem.write(ResourceFactory.newClassPathResource("t/drools/rules/Product_rules.xls"));


        KieBuilder kb = kieServices.newKieBuilder(kieFileSystem);
        kb.buildAll();
        KieModule kieModule = kb.getKieModule();

        KieContainer kContainer = kieServices.newKieContainer(kieModule.getReleaseId());

        return kContainer.newKieSession();

    }

    public KieSession getKieSession(Resource dt) {
        KieFileSystem kieFileSystem = kieServices.newKieFileSystem()
            .write(dt);

        KieBuilder kieBuilder = kieServices.newKieBuilder(kieFileSystem)
            .buildAll();

        KieRepository kieRepository = kieServices.getRepository();

        ReleaseId krDefaultReleaseId = kieRepository.getDefaultReleaseId();

        KieContainer kieContainer = kieServices.newKieContainer(krDefaultReleaseId);

        KieSession ksession = kieContainer.newKieSession();

        return ksession;
    }

    /*
     * Can be used for debugging
     * Input excelFile example: t/drools/rules/Discount.xls
     */
    public String getDrlFromExcel(String excelFile) {
        DecisionTableConfiguration configuration = KnowledgeBuilderFactory.newDecisionTableConfiguration();
        configuration.setInputType(DecisionTableInputType.XLS);

        Resource dt = ResourceFactory.newClassPathResource(excelFile, getClass());

        DecisionTableProviderImpl decisionTableProvider = new DecisionTableProviderImpl();

        String drl = decisionTableProvider.loadFromResource(dt, null);

        return drl;
    }

}