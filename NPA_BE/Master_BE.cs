using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace PA_BE
{
    public class Master_BE
    {

        //Login
        public string User { get; set; }


        //GENERAL
        public string Id { get; set; }
        public string Action { get; set; }
        public string UserID { get; set; }
        public string IP { get; set; }
        public string Active { get; set; }

        //state
        public string statecode { get; set; }
        public string stateName { get; set; }

        //District
        public string DistName { get; set; }
        public string DistCode { get; set; }
        public string Distcode_LG { get; set; }


        //DESIGNATION
        public string DesignationID { get; set; }
        public string DesignationName { get; set; }
        public string cadre { get; set; }

        //Section
        public string SectionID { get; set; }
        public string SectionName { get; set; }

        //Employee
        public string EmpId { get; set; }
        public string Empcode { get; set; }
        public string EmpName { get; set; }
        public string Mobile { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string DOB { get; set; }
        public string Gender { get; set; }
        //
        public string DOJService { get; set; }
        public string DOJCurrrentPosition { get; set; }
        public string Father_HusbandName { get; set; }
        public string Qualification { get; set; }
        public string Community { get; set; }
        public string ExServiceMan { get; set; }
        public string DifferentlyAbled { get; set; }
        public string Disability { get; set; }
        public string TempAdd { get; set; }
        public string PermAdd { get; set; }
        public string DesignationTOJ { get; set; }
        public string CurrentDesignation { get; set; }
        public string PanNo { get; set; }
        // 

        //UserDetails
        public string UserType { get; set; }
        public string ReportingOfficer { get; set; }
        public string doj { get; set; }
        public string EmpType { get; set; }
        public string RoleID { get; set; }
        public string RoleName { get; set; }
        public string Type { get; set; }
        public string Username { get; set; }
        public string EffecTO { get; set; }
        public string Effectfrom { get; set; }

        //LeaveType
        public string TypeId { get; set; }
        public string TypeName { get; set; }
        public string Applicable { get; set; }
        public string Noleaves { get; set; }
        public string AppliesFor { get; set; }
        public string MaxTime { get; set; }
        public string Linked { get; set; }
        public string NoofChildren { get; set; }
        public string LeavesEach { get; set; }
        public string MinLvs { get; set; }
        public string YrEndStatus { get; set; }
        public string ReqJoining { get; set; }
        public string Extended { get; set; }

        //LeaveBalance
        public string AsOnDate { get; set; }
        public string LeaveBalance { get; set; }
        // public DataTable Tvp { get; set; }

        // Leave Details
        public string Station_leave { get; set; }
        public string Remarks { get; set; }
        public byte[] Doc_Content { get; set; }
        public string Reason { get; set; }
        public string Doc_Name { get; set; }
        public string Doc_Type { get; set; }
        public string Doc_Size { get; set; }
        public string Status { get; set; }
        public string OfficerStatus { get; set; }


        //Holiday Master Sampath
        public string HYear { get; set; }
        public string HMonth { get; set; }
        public string Hid { get; set; }

        public DataTable HTvp { get; set; }

        //emp Reg 
        public string TreasuryCode { get; set; }
        public string SurName { get; set; }
        public string MotherName { get; set; }
        public string Nationality { get; set; }
        public string EmpHusFatName { get; set; }
        public string Religion { get; set; }
        public string MotherTng { get; set; }
        public string MrgStatus { get; set; }
        public string DifferentAbled { get; set; }
        public string IdentMarkOne { get; set; }
        public string IdentMarkTwo { get; set; }
        public string HomeSate { get; set; }
        public string HomeDistrict { get; set; }
        public string LicHomeTown { get; set; }
        public string NearRailStation { get; set; }
        public string Mandal { get; set; }
        public string DrHusNo { get; set; }
        public string Locality { get; set; }
        public string Village { get; set; }
        public string PinCode { get; set; }
        public string PerStateCode { get; set; }
        public string PerDistrict { get; set; }
        public string PerMandal { get; set; }

        public string PerDrHusNo { get; set; }
        public string PerLocality { get; set; }
        public string PerVillage { get; set; }
        public string PerPinCode { get; set; }
        public string phone { get; set; }
        public string Aadhar { get; set; }
        public string PresentAddress { get; set; }
        public string Photo { get; set; }
        public string Signature { get; set; }


        public string fileNm { get; set; }
        public string fileSize { get; set; }
        public string fileType { get; set; }
        public byte[] content { get; set; }

        public string fileNme { get; set; }
        public string fileSizee { get; set; }
        public string fileTypee { get; set; }
        public byte[] contentt { get; set; }

        public string SignfileNme { get; set; }
        public string SignfileSizee { get; set; }
        public string SignfileTypee { get; set; }
        public byte[] Signcontentt { get; set; }

        public string MandalCode { get; set; }
        //public string MandalName { get; set; }
        public string VillCode { get; set; }
        //public string VillName { get; set; }
        //public string EffectiveDt { get; set; }
        public string DivisionCode { get; set; }
        public string DivisionName { get; set; }
        //public string Distcode_LG { get; set; }



        //Current Posting 
        public string CurrentPost { get; set; }
        public string CurrentDist { get; set; }
        public string OffLevel { get; set; }
        public string CurrentPostOff { get; set; }
        public string CurrentClass { get; set; }
        public string EstOff { get; set; }
        public string ModeOfRec { get; set; }
        public string CurrentEstaDep { get; set; }
        public string DOJ { get; set; }
        public string DOR { get; set; }


        //Education Qualification 
        public string Discipline { get; set; }
        public string Qualificationcode { get; set; }
        public string BoardUniver { get; set; }
        public string YrPass { get; set; }
        public string Exam { get; set; }
        public string Marks { get; set; }
        public DataTable Etvp { get; set; }

        //family details
        public string Discipline_Code { get; set; }
        public string MemberName { get; set; }
        public string Relation { get; set; }
        public string Dependent { get; set; }
        public DataTable Ftvp { get; set; }
        public DataTable Tvp { get; set; }


        //joining details 
        public string Department { get; set; }
        public string OfficeName { get; set; }
        public string ConfOrdNum { get; set; }
        public string ApointgAuthority { get; set; }
        public string PayCommsion { get; set; }
        public string offType { get; set; }
        public string PayScale { get; set; }
        public string BasicPay { get; set; }
        public string DeductionType { get; set; }
        public string MemberofGIS { get; set; }


        //awards
        public string NatOfAwards { get; set; }
        public string Discription { get; set; }


        //departmentProcceding
        public string ChargesDetils { get; set; }
        public string Penalty { get; set; }
        public string OrderDt { get; set; }
        public string OrderNum { get; set; }
        //leavedetils

        //departmentProcceding  
        public string CreaditDebit { get; set; }
        public string FmDt { get; set; }
        public string ToDt { get; set; }
        public string TypeofContr { get; set; }
        public string NomineeNm { get; set; }
        public string NomAddress { get; set; }
        public string GurdainNm { get; set; }


        //PromotionDetails 
        public string DesignationFrom { get; set; }
        public string DesignationTo { get; set; }
        public string ScaleFrom { get; set; }
        public string ScaleTo { get; set; }
        public string Transfer { get; set; }
        public string Percentage { get; set; }

        public string TrainingType_Code { get; set; }
        public string TrainingCode { get; set; }
        public string NameofInst_Code { get; set; }
        public string NoDaysTrng { get; set; }
        public string OfficeFrom { get; set; }
        public string OfficeTo { get; set; }

        //Current Posting
        public string OfficeId { get; set; }

        //AddItemSection
        public string ItemName { get; set; }
        public string ItemId { get; set; }

        //TypeofPost
        public string PostTypeId { get; set; }
        public string PostTypeName { get; set; }

        //POST
        public string Postname { get; set; }
        public string PostDescription { get; set; }
        public string Exp { get; set; }
        public string ExpDet { get; set; }
        public string Disclaimer { get; set; }
        public string no_of_Posts { get; set; }
        public string Placement { get; set; }
        public string Salary { get; set; }
        public string AgeLimit { get; set; }
        public string AppliFee { get; set; }
        public string Fee { get; set; }


        //Appy Leave
        public string Prefix { get; set; }
        public string PostFix { get; set; }

        //Cancel Leave
        public string CancelFrm { get; set; }
        public string CancelTo { get; set; }
        public string CType { get; set; }


        //PrintApplication Form
        public string ApplicationId { get; set; }


        //Joining details
        public string LType { get; set; }
        public string JType { get; set; }

        public string Ip { get; set; }

        public DataTable TVP1 { get; set; }


    }
}
