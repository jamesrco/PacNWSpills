# PacNWSpills
Analysis of spill &amp; release data from Oregon and Washington

## Data source descriptions and provenance
**[Oregon DEQ spills data](https://github.com/jamesrco/PacNWSpills/blob/master/data/raw/DEQ/OregonSpillsData_ERIS_OC_03APR2018.xls):** Oregon DEQ spills program incident records from roughly 1994 to April 2018. For spills prior to 2005 in particular, many locations and (in some cases) spill volumes were not fully vetted so the data should be treated with some skepticism. The dataset includes information from the current DEQ incident management database (OpsCenter) as well as records imported from DEQ's previous spills program database, ERIS. Provided by Kimberlee Van Patten at DEQ HQ. For all incidents with status "Closed" where the quantity spilled is greater than the reportable quantity (RQ), the spill/release volumes should be considered generally reliable -- vetted data based on agency investigation. The NRC report numbers in this dataset should correspond (where applicable) to report numbers in the [NRC data](https://github.com/jamesrco/PacNWSpills/tree/master/data/raw/NRC_annual).

**[National Response Center report records](https://github.com/jamesrco/PacNWSpills/tree/master/data/raw/NRC_annual):** National Response Center report records for calendar years 1990 through December 2018 ("Current"). These were downloaded directly from the [landing page of the NRC web site](http://nrc.uscg.mil/) on December 17, 2018. The spill volumes, locations, and product identities in NRC reports should be viewed with skepticism since each report is released based solely on the information provided by the reporting source. In the vast majority of cases, few of the details in these NRC reports have been vetted by an investigating agency.

**[Oregon Emergency Response System (OERS) initial report and notification data](https://github.com/jamesrco/PacNWSpills/tree/master/data/raw/OERS):** Data for all notifications of type "CBT" (Chemical, biological, technological) reported to the Oregon Emergency Response System from 2007 to December 2018. There is a chance notifications for some spills may be missing from these data if they were reported to OERS as another incident type. Records in [OERSOpsCenter_IncidentTypeReport_CBT_AllCounties_2007-2018.csv](https://github.com/jamesrco/PacNWSpills/blob/master/data/raw/OERS/OERSOpsCenter_IncidentTypeReport_CBT_AllCounties_2007-2018.csv) were extracted on December 17, 2018, using OpsCenter's user-end "Incident Type Report" query, while the data in 
[All_CBT_Incidents_Request_OEM_20181218.csv](https://github.com/jamesrco/PacNWSpills/blob/master/data/raw/OERS/All_CBT_Incidents_Request_OEM_20181218.csv) were extracted using a custom query on December 17, 2018. Some information in the two files is duplicative, and multiple notifications may exist for the same OERS number in cases where updated information was received by the OERS operator. Custom query data courtesy of Daniel Stoelb, GIS Program Coordinator for the Oregon Office of Emergency Management. As in the case of NRC reports, the spill volumes, locations, and product identities in these OERS notifications should be viewed with skepticism since (in most cases) they reflect information provided by the reporting source. For OERS notifications based on NRC reports, location and release information are generally pulled directly from the corresponding NRC report.
