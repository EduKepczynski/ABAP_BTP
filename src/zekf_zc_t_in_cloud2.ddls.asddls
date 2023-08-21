@EndUserText.label: 'Schedule Information'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Search.searchable: true
@Metadata.allowExtensions: true

define view entity ZEKF_ZC_T_IN_CLOUD2 as projection on ZEKF_ZI_T_IN_CLOUD2
{

key ScheduleUuid,
      CourseBegin,
      CourseUuid,
      @Search.defaultSearchElement: true
      Location,
      @Search.defaultSearchElement: true
      Trainer,
      IsOnline,
      LastChangedAt,
      LocalLastChangedAt,

      /* Associations */
      _Course : redirected to parent ZEKF_ZC_T_IN_CLOUD
    
}
