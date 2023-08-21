@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Schedule Information'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZEKF_ZI_T_IN_CLOUD2
  as select from zekf_t_in_cloud2 as Schedule
  association to parent ZEKF_ZI_T_IN_CLOUD as _Course on $projection.CourseUuid = _Course.CourseUuid
{

  key Schedule.schedule_uuid         as ScheduleUuid,
      Schedule.course_begin          as CourseBegin,
      Schedule.course_uuid           as CourseUuid,
      Schedule.location              as Location,
      Schedule.trainer               as Trainer,
      Schedule.is_online             as IsOnline,
      @Semantics.systemDateTime.lastChangedAt: true
      Schedule.last_changed_at       as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      Schedule.local_last_changed_at as LocalLastChangedAt,

      _Course

}
