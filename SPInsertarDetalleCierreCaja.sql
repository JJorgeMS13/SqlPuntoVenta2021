-- =============================================
-- Author:  	José Jorge Martinez Suárez
-- Create date: 16/01/2021
-- Description:	Crud de MovimientoCajaCierre
-- =============================================
CREATE PROCEDURE SPInsertarDetalleCierreCaja
@FechaIni datetime,
@FechaFin datetime,
@FechaCierre datetime,
@Ingresos numeric(18, 2),
@Egresos numeric(18, 2),
@Saldo numeric(18, 2),
@IdUsuario int,
@TotalCalculado numeric(18, 2),
@TotalReal numeric(18, 2),
@Estado varchar(50),
@Diferiencia numeric(18, 2),
@IdCaja int

AS
BEGIN

  IF EXISTS (SELECT
      Estado
    FROM MOVIMIENTOCAJACIERRE M
    WHERE M.Estado = 'CAJA APERTURADA')
    RAISERROR ('Ya Fue iniciado el Turno de esta Caja', 16, 1);

  ELSE
  BEGIN
    INSERT INTO MOVIMIENTOCAJACIERRE ()
      VALUES (@FechaIni, @FechaFin, @FechaCierre, @Ingresos, @Egresos, @Saldo, @IdUsuario, @TotalCalculado, @TotalReal, @Estado, @Diferiencia, @IdCaja)
  END

END