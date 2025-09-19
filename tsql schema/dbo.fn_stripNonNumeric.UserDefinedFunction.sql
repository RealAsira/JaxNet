/*
Written by Asira 2022
Function fn_stripNonNumeric - only keep numeral chars
07-28-2024 added "e" as part of keep string, for scientific notation floats.
*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[fn_stripNonNumeric](@str VARCHAR(MAX))
Returns VARCHAR(MAX)
AS
Begin

    DECLARE @keepValues AS VARCHAR(50)
    SET @keepValues = '%[^0-9.-e]%'
    WHILE PatIndex(@keepValues, @str) > 0
      SET @str = Stuff(@str, PatIndex(@keepValues, @str), 1, '')

    RETURN @str
End
GO
