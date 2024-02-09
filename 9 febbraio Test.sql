--1) Conteggio dei verbali trascritti
--SELECT COUNT (*) AS VerbaliTrascritti FROM Verbale; 

--2) Conteggio dei verbali trascritti raggruppati per anagrafe, 
--SELECT Cognome, Nome, 
--COUNT (*) AS VerbaliTrascritti FROM Verbale 
--LEFT JOIN Angrafica 
--ON FK_Id_Violazione = IdVerbale 
--GROUP BY Cognome, Nome;

--3) Conteggio dei verbali trascritti raggruppati per tipo di violazione, 
--SELECT Descrizione,
--COUNT (*) AS VerbaliTrascritti FROM Verbale 
--LEFT JOIN Violazione 
--ON IdViolazione = IdVerbale 
--GROUP BY Descrizione;

--4) Totale dei punti decurtati per ogni anagrafe, 
--SELECT Nome, Cognome, SUM(DecurtamentoPunti) FROM Verbale
--LEFT JOIN Angrafica
--ON FK_Id_Violazione = IdVerbale
--GROUP BY Nome, Cognome;

--5) Cognome, Nome, Data violazione, Indirizzo violazione, importo e punti decurtati per tutti gli anagrafici residenti a Palermo, 
--SELECT Cognome, Nome, DataViolazione,IndirizzoViolazione, Importo, DecurtamentoPunti 
--FROM Angrafica
--JOIN Verbale
--ON IdVerbale = FK_Id_Violazione
--WHERE Città ='Palermo'

--6) Cognome, Nome, Indirizzo, Data violazione, importo e punti decurtati per le violazioni fatte tra il febbraio 2009 e luglio 2009, 
--SELECT Cognome, Nome, Indirizzo, DataViolazione, Importo, DecurtamentoPunti
--FROM Angrafica
--JOIN Verbale
--ON IdVerbale = FK_Id_Violazione
--WHERE DataViolazione BETWEEN '2009-02-01' AND '2009-07-01'

--7) Totale degli importi per ogni anagrafico, 
--SELECT Cognome, Nome, SUM(Importo) AS TotaleImporti
--FROM Angrafica
--JOIN VERBALE
--ON IdVerbale = FK_Id_Violazione
--GROUP BY Cognome, Nome

--8) Visualizzazione di tutti gli anagrafici residenti a Palermo, 
--SELECT * FROM Angrafica WHERE Città = 'Palermo'

--9) Query parametrica che visualizzi Data violazione, Importo e decurtamento punti relativi ad una certa data,
--DECLARE @data date
--SET @data = '2023-02-10'
--SELECT DataViolazione, Importo, DecurtamentoPunti FROM Verbale
--WHERE DataViolazione = @data

--10) Conteggio delle violazioni contestate raggruppate per Nominativo dell’agente di Polizia, 
--SELECT NominativoAgente, COUNT(*) AS Conteggio FROM Verbale GROUP BY NominativoAgente

--11) Cognome, Nome, Indirizzo, Data violazione, Importo e punti decurtati per tutte le violazioni che superino il decurtamento di 5 punti, 
--SELECT Cognome, Nome, Indirizzo, DataViolazione, Importo, DecurtamentoPunti
--FROM Angrafica
--LEFT JOIN Verbale
--ON FK_Id_Violazione = IdVerbale
--WHERE DecurtamentoPunti >= 5

--12) Cognome, Nome, Indirizzo, Data violazione, Importo e punti decurtati per tutte le violazioni che superino l’importo di 400 euro. 
--SELECT Cognome, Nome, Indirizzo, DataViolazione, Importo, DecurtamentoPunti
--FROM Angrafica
--LEFT JOIN Verbale
--ON FK_Id_Violazione = IdVerbale
--WHERE Importo >= 400


---STORED PROCEDURES---

--1) Una SP parametrica che, ricevendo in input un anno, visualizzi l’elenco delle contravvenzioni effettuate in un quel determinato anno, 
--CREATE PROCEDURE ContravvenzioniAnnoX @anno int
--AS
--BEGIN
--	SELECT * FROM Verbale
--	WHERE YEAR(DataViolazione) = @anno
--END
--GO

--2) Una SP parametrica che, ricevendo in input una data, visualizzi il totale dei punti decurtati in quella determinata data, 
--CREATE PROCEDURE PuntiDecurtatiAnnoX @anno int
--AS
--BEGIN
--	SELECT @anno AS Anno, SUM(DecurtamentoPunti) AS Totale FROM Verbale
--	WHERE YEAR(DataViolazione) = @anno
--END
--GO

--3) Una SP che consenta di eliminare un determinato verbale identificandolo con il proprio identificativo. 
--CREATE PROCEDURE EliminaVerbaleX @IdVerbale int
--AS
--BEGIN
--	DELETE FROM Verbale WHERE IdVerbale = @IdVerbale
--END
--GO