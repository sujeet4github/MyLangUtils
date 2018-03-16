package t.drools.service;

import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.Test;
import org.kie.api.io.Resource;
import org.kie.api.runtime.KieSession;
import org.kie.internal.io.ResourceFactory;

import org.drools.decisiontable.DecisionTableProviderImpl;

import t.drools.config.DroolsBeanFactory;
import t.drools.model.Customer;
import t.drools.model.Customer.CustomerType;

public class DiscountExcelIntegrationTest {

    private KieSession kSession;
    private String drl;

    @Before
    public void setup() {
        Resource resource = ResourceFactory.newClassPathResource("t/drools/rules/Discount.xls", getClass());

        DecisionTableProviderImpl decisionTableProvider
		  = new DecisionTableProviderImpl();

		drl = decisionTableProvider.loadFromResource(resource, null);

        kSession = new DroolsBeanFactory().getKieSession(resource);
    }

    @Test
    public void giveIndvidualLongStanding_whenFireRule_thenCorrectDiscount() throws Exception {

		System.out.println("Using this DRL file:" + drl);

        Customer customer = new Customer(CustomerType.INDIVIDUAL, 5);
        kSession.insert(customer);

        kSession.fireAllRules();

        assertEquals(customer.getDiscount(), 15);
    }

    @Test
    public void giveIndvidualRecent_whenFireRule_thenCorrectDiscount() throws Exception {

        Customer customer = new Customer(CustomerType.INDIVIDUAL, 1);
        kSession.insert(customer);

        kSession.fireAllRules();

        assertEquals(customer.getDiscount(), 5);
    }

    @Test
    public void giveBusinessAny_whenFireRule_thenCorrectDiscount() throws Exception {
        Customer customer = new Customer(CustomerType.BUSINESS, 0);
        kSession.insert(customer);

        kSession.fireAllRules();

        assertEquals(customer.getDiscount(), 20);
    }

}