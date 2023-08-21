@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Course Information'

@Search.searchable: true
@Metadata.allowExtensions: true

define root view entity ZEKF_ZC_T_IN_CLOUD
  as projection on ZEKF_ZI_T_IN_CLOUD
{

  key CourseUuid,
      @Search.defaultSearchElement: true
      CourseId,
      @Search.defaultSearchElement: true
      CourseName,
      CourseLength,
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Country', element: 'Country'} }]
      Country,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency', element: 'Currency'} }]
      CurrencyCode,
      LastChangedAt,
      LocalLastChangedAt,

      /* Associations */
      _Country,
      _Currency,
      _Schedule : redirected to composition child ZEKF_ZC_T_IN_CLOUD2
}
