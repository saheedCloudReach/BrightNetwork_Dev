public class DotMailerAccountMapping {
            
    public static Map<String, String> getAccountMapping() {
        return getMapping(true);
    }
    public static Map<String, String> getLeadMapping() {
        return getMapping(false);
    }
    
    public static Map<String, String> getMapping(Boolean isAccount) {
        Map<String, Dotmailer_Mapping__c> mappings = Dotmailer_Mapping__c.getAll();
        Map<String, String> result = new Map<String, String>();
        
        for (String key : mappings.keySet()) {
            Dotmailer_Mapping__c mapping = mappings.get(key);
            if ((!mapping.Is_Lead_Mapping__c && isAccount) || (mapping.Is_Lead_Mapping__c && !isAccount)) {
               result.put(mapping.Salesforce_Field_Name__c, mapping.Dotmailer_Field_Name__c);
            }
        }
        
        return result;

    }
        private static Map<String, String> SFDC_TO_DM_ACCOUNT_MAPPING = 
          new Map<String, String> {
                'Career_status__c' => 'CAREER_STATUS',
                'University__c'  =>  'UNIVERSITY',
                'Phone'        => 'PHONE',
                'Graduation_Year__c' => 'GRADUATIONYEAR',
                'Gender__c' => 'GENDER',
                'Birth_Day__c' => 'BIRTH_DAY',
                'Birth_Month__c' => 'BIRTH_MONTH',
                'Right_To_Work_In_UK__c' => 'RIGHT_TO_WORK',
                'School_Name__c' => 'SCHOOL_NAME',
                'School_Type__c' => 'SCHOOL_TYPE',
                'FirstName' => 'FIRSTNAME',
                'LastName' => 'LASTNAME',
                'School_Type__c' => 'SCHOOL_TYPE',
                'Equal_Opportunities__c' => 'EQUAL_OPPORTUNITIES',
                'Twitter_Handle__c' =>  'TWITTER_HANDLE',
                'Fresher_Fair_Campaign__c' =>   'FRESHER_FAIR_CAM',
                'Lead_Source_Formula__c' => 'LEAD_SOURCE_FORMULA',
                'cv_path__c' => 'CV_PATH',
                'Id' => 'SALESFORCE_ID',
                'A_level_or_equivalent_grade_1__c' => 'A_LEVEL_1_GRADE',
                'A_level_or_equivalent_grade_2__c' => 'A_LEVEL_2_GRADE',
                'A_level_or_equivalent_grade_3__c' => 'A_LEVEL_3_GRADE',
                'A_level_or_equivalent_grade_4__c' => 'A_LEVEL_4_GRADE',
                'A_level_or_equivalent_grade_5__c' => 'A_LEVEL_5_GRADE',
                'A_level_or_equivalent_subject_1__r.Name' => 'A_LEVEL_1',
                'A_level_or_equivalent_subject_2__r.Name' => 'A_LEVEL_2',
                'A_level_or_equivalent_subject_3__r.Name' => 'A_LEVEL_3',
                'A_level_or_equivalent_subject_4__r.Name' => 'A_LEVEL_4',
                'A_level_or_equivalent_subject_5__r.Name' => 'A_LEVEL_5',
                'Undergraduate_Degree_Grade__c' => 'UNDERGRAD_DEGREE_GRA',
                'Undergraduate_Degree_Subject_1__r.Name' => 'UNDERGRAD_DEGREE_1',
                'Undergraduate_Degree_Subject_2__r.Name' => 'UNDERGRAD_DEGREE_2',
                'Undergraduate_Degree_Subject_3__r.Name' => 'UNDERGRAD_DEGREE_3',
                'Undergraduate_Degree_Subject_4__r.Name' => 'UNDERGRAD_DEGREE_4',
                'Undergraduate_Degree_Subject_5__r.Name' => 'UNDERGRAD_DEGREE_5',
                'Maths_A_level_Grade_or_equivalent__c' => 'MATHS_A_LEVEL_GRADE',
                'Maths_A_level_or_equivalent__c' => 'MATHS_A_LEVEL',
                'Id' => 'SALESFORCE_ID',
                'Course_includes_industrial_placement__c' => 'COURSE_INDUSTRIAL_PL',
                'Free_school_meals__c' => 'FREE_SCHOOL_MEALS',
                'Disability_or_learning_difficulties__c' => 'DISABILITY',
                'Disability_more_information__c' => 'DISABILITY_MORE_INFO',
                'Sexuality__c' => 'SEXUALITY',
                'Ethnicity__c' => 'ETHNICITY',
                'Course_year_at_signup__c' => 'YEAR_AT_SIGNUP',
                'Length_of_course__c' => 'LENGTH_OF_COURSE'
        };
            
        private static Map<String, String> SFDC_TO_DM_LEAD_MAPPING = 
            new Map<String, String> {
                'FirstName' =>  'FIRSTNAME',
                'LastName' => 'LASTNAME',
                'Email' => 'EMAIL',
                'Phone' => 'PHONE',
                'University__c' => 'UNIVERSITY',
                'Graduation_Year__c' => 'GRADUATIONYEAR',
                'Gender__c' => 'GENDER',
                'Right_To_Work_In_UK__c' => 'RIGHT_TO_WORK',
                'Lead_Source_Formula__c' => 'LEAD_SOURCE_FORMULA',
                'Double_Opt_In_Link__c' => 'DOUBLE_OPT_IN_LINK',
                'Undergraduate_Degree_Subject_1__r.Name' => 'UNDERGRAD_DEGREE_1',
                'Undergraduate_Degree_Subject_2__r.Name' => 'UNDERGRAD_DEGREE_2',
                'Undergraduate_Degree_Subject_3__r.Name' => 'UNDERGRAD_DEGREE_3',
                'Undergraduate_Degree_Subject_4__r.Name' => 'UNDERGRAD_DEGREE_4',
                'Undergraduate_Degree_Subject_5__r.Name' => 'UNDERGRAD_DEGREE_5'
        };            
            
}