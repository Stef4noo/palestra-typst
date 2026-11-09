#import "template_verbale.typ": *

#let cchangelog = (
  [1.2.0],
  [2026-11-03],
  [Aggiunte le sezioni 2.2., 3.2.5., 4.1. Piccole modifiche al resto del documento.],
  [Costanza Gyulai],
  [Stefano Sironi],

  [1.1.0],
  [2026-11-03],
  [Aggiunta alla tabella di versionamento la colonna _Verificatore_.],
  [Angelo Tuoni],
  [Giacomo De Lucchi],

  [1.0.0],
  [2026-10-29],
  [Modifica alla distribuzione oraria.],
  [Michele Moro],
  [Angelo Tuoni],

  [0.3.0],
  [2026-10-29],
  [Aggiunta l'analisi e la rotazione dei ruoli.],
  [Stefano Sironi],
  [Angelo Tuoni],

  [0.2.1],
  [2026-10-29],
  [Modifiche alla distribuzione oraria.],
  [Costanza Gyulai],
  [Angelo Tuoni],

  [0.2.0],
  [2026-10-26],
  [Stesura prima versione.],
  [Giovanni Biba],
  [Costanza Gyulai],

  [0.1.0],
  [2026-10-25],
  [Creazione del documento e struttura.],
  [Angelo Tuoni],
  [Giovanni Biba],
)

#show: template.with(
  doctitle: [Verbale interno della riunione del 2026-11-05],
  writer: "Michele Moro",
  meetingplace: "Discord",
  meetingtime: "21:00 - 22:15",
  participants: "Giacomo de Lucchi, Costanza Gyulai, Stefano Sironi, Angelo Tuoni, Yi Ming Ye, Giovanni Biba",
)

hello
helllo

= Ordine del giorno
+ Revisione del preventivo dei costi e dichiarazione di impegni.
+ Revisione di tutti i verbali.
+ Revisione del versionamento dei documenti.
+ Adozione di un Issue Tracking System.
+ Stabilire un giorno per la riunione settimanale.

= Svolgimento della riunione
== Revisione del preventivo dei costi e dichiarazione di impegni
Come primo punto è stata decisa la totale revisione del documento in base alle osservazioni fornite dal professor Vardanega durante la lezione, aggiungendo diverse nuove sezioni.

== Revisione di tutti i verbali
Successivamente, è stata discussa la modifica alla struttura e all’organizzazione delle informazioni di tutti i verbali redatti in precedenza. È stato deciso di inserire una colonna dedicata al numero della issue nella tabella che ricapitola le decisioni prese e le azioni da intraprendere. Nei verbali passati questa colonna rimane vuota dato che il gruppo alla data di stesura di questo verbale non ha adottato un sistema di issue tracking.

== Revisione del versionamento dei documenti
È stata discussa, inoltre, la tabella di versionamento presente nel frontespizio dei documenti, decidendo di aggiungere la colonna che indicasse il verificatore per ogni modifica.

== Adozione di un Issue Tracking System
Infine, è stata discussa l’adozione di un sistema di tracciamento delle Issues, sono stati soppesati i pro e i contro di ciascuna opzione disponibile, ed è stato deciso di utilizzare l’ITS integrato in GitHub.

== Stabilire un giorno per la riunione settimanale
È stato deciso che da ora in avanti le riunioni del gruppo si svolgeranno il Lunedì alle ore 21:00.

#todos(
  [],
  [Revisione preventivo],
  [Aggiungere sezioni in base ad indicazioni del professore],
  [Costanza Gyulai, Angelo Tuoni],
  [2026/11/03],

  [],
  [Revisione di tutti i verbali],
  [Sistemare l'organizzazione delle informazioni],
  [Giacomo De Lucchi, Michele Moro],
  [2026/11/03],

  [],
  [Revisione del versionamento dei documenti],
  [Rifare le tabelle di versionamento],
  [Stefano Sironi, Giovanni Biba],
  [2026/11/03],

  [],
  [Adozione di un Issue Tracking System],
  [Attivazione del sistema],
  [Giacomo De Lucchi],
  [2026/11/09],
)
