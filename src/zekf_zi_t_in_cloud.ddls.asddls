//@AbapCatalog.sqlViewName: ''
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Course Information'
define root view entity ZEKF_ZI_T_IN_CLOUD
  as select from zekf_t_in_cloud as Course
  composition [0..*] of ZEKF_ZI_T_IN_CLOUD2 as _Schedule
  association [0..1] to I_Currency          as _Currency on $projection.CurrencyCode = _Currency.Currency
  association [0..1] to I_Country           as _Country  on $projection.Country = _Country.Country
{

  key Course.course_uuid           as CourseUuid,
      Course.course_id             as CourseId,
      Course.course_name           as CourseName,
      Course.course_length         as CourseLength,
      Course.country               as Country,
      Course.price                 as Price,
      Course.currency_code         as CurrencyCode,
      @Semantics.systemDateTime.lastChangedAt: true
      Course.last_changed_at       as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      Course.local_last_changed_at as LocalLastChangedAt,

      _Schedule,
      _Currency,
      _Country

}
