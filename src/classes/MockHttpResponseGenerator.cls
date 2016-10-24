global class MockHttpResponseGenerator implements HttpCalloutMock {
    
    private DotMailerAttributeChangeRequest expectedRequest;
    private AccountConversionMessage expectedConversionRequest;
    
    public MockHttpResponseGenerator(DotMailerAttributeChangeRequest expectedRequest, 
                                     AccountConversionMessage expectedConversionRequest) {
                                         this.expectedRequest = expectedRequest;
                                         this.expectedConversionRequest = expectedConversionRequest;
                                     }
    
    global HTTPResponse respond(HTTPRequest httpReq) {
        if (httpReq.getEndpoint().endsWithIgnoreCase('/preference/update')) {
            verifyRequest(expectedRequest, (DotMailerAttributeChangeRequest)
                          JSON.deserialize(httpReq.getBody(), DotMailerAttributeChangeRequest.class));
        } else if (httpReq.getEndpoint().endsWithIgnoreCase('/account/delete')
                   || httpReq.getEndpoint().endsWithIgnoreCase('/account/unsubscribe')
                   || httpReq.getEndpoint().endsWithIgnoreCase('/account/accept')) {
                       verifyRequest(expectedConversionRequest, (AccountConversionMessage)
                                     JSON.deserialize(httpReq.getBody(), AccountConversionMessage.class));
                   }
        
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"foo":"bar"}');
        res.setStatusCode(200);
        return res;
    }
    
    private void verifyRequest(DotMailerAttributeChangeRequest expected, DotMailerAttributeChangeRequest actual) {
        if (expected == null)
            return;
        
        System.assertEquals(expected.email, actual.email);
       /* System.assertEquals(getFieldValue(expected.fields, 'GENDER'), 
                            getFieldValue(actual.fields, 'GENDER'));*/
    }
    
    private void verifyRequest(AccountConversionMessage expected, AccountConversionMessage actual) {
        if (expected == null)
            return;
        
        for (String email : expected.emails) { 
            System.assert((new Set<String>(actual.emails)).contains(email),
                          'The requests do not match. Expected: ' + expected + ' Actual: ' + actual);
        }
    }
    
/*    private String getFieldValue(List<DotMailerAttributeChangeRequest.DotMailerField> fields, 
                                 String fieldName) {
                                     for (DotMailerAttributeChangeRequest.DotMailerField field : fields) {
                                         if (field.fieldName == fieldName)
                                             return field.fieldValue;
                                     }
                                     
                                     return null;
                                     
                                 } */
}