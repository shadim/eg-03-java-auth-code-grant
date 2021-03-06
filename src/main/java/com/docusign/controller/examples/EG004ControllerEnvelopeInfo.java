package com.docusign.controller.examples;

import com.docusign.esign.api.EnvelopesApi;
import com.docusign.esign.client.ApiClient;
import com.docusign.esign.client.ApiException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/eg004")
public class EG004ControllerEnvelopeInfo extends EGController {

    @Autowired
    HttpSession session;

    @Override
    protected void addSpecialAttributes(ModelMap model) {
        model.addAttribute("envelopeOk", session.getAttribute("envelopeId") != null);
    }

    @Override
    protected String getEgName() {
        return "eg004";
    }

    @Override
    protected String getTitle() {
        return "Get envelope information";
    }

    @Override
    protected String getResponseTitle() {
        return "Get envelope status results";
    }

    @Override
    protected Object doWork(WorkArguments args, ModelMap model,
                            String accessToken, String basePath) throws ApiException {

        ApiClient apiClient = new ApiClient(basePath);
        apiClient.addDefaultHeader("Authorization", "Bearer " + accessToken);
        EnvelopesApi envelopesApi = new EnvelopesApi(apiClient);
        setMessage("Results from the Envelopes::get method:");
        return envelopesApi.getEnvelope(args.getAccountId(), args.getEnvelopeId());
    }

}
