trigger SectorJunctionObjectTrigger on Sector_Junction_Obj__c (before insert, after insert, after update, before update, before delete) {
	new SectorTriggerHandler().run();
}