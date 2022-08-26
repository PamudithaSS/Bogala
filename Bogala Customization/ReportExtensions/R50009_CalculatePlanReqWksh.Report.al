reportextension 50009 CalculatePlanReqWksh extends "Calculate Plan - Req. Wksh."
{
    dataset
    { }
    requestpage
    {
        // trigger OnOpenPage()
        // begin
        //     FromDate := 20140101D;//010114D;
        //     ToDate := 20141231D;//123114D;
        // end;
    }

    trigger OnPreReport()
    begin
        CurrTemplateName := 'BATCH';
        CurrWorksheetName := 'AUTO';
    end;

    var
        CompanyInfoUp: Record "Company Information";
        Check: Report Check;
        FormatNext: array[3] of Text[350];
}