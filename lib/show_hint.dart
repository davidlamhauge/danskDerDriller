import 'package:flutter/material.dart';

AlertDialog getDialog(String subj) {
  switch (subj) {
    case 'nutidsr':
      return _getNutidsr(subj);
    case 'dobbeltk':
      return _getDobbeltk(subj);
    case 'stumme':
      return _getStumme(subj);
    case 'ligge':
      return _getLigge(subj);
    case 'eneende':
      return _getEneEnde(subj);
    case 'adaf':
      return _getAdAf(subj);
    case 'nogen':
      return _getNogen(subj);
    default:
      return _getNutidsr(subj);
  }
}

/*
                SubjectButton(subject: 'nutidsr',   txt: 'Nutids-R ?'),
                SubjectButton(subject: 'dobbeltk',  txt: 'Dobbeltkonsonant ?'),
                SubjectButton(subject: 'stumme',    txt: 'Stumme bogstaver ?'),
                SubjectButton(subject: 'ligge',     txt: 'Ligge eller lægge ?'),
                SubjectButton(subject: 'eneende',   txt: '-ene eller -ende ?'),
                SubjectButton(subject: 'adaf',      txt: 'Ad eller af ?'),
                SubjectButton(subject: 'nogen',     txt: 'Nogen eller nogle ?'),
 */
AlertDialog _getNutidsr(String subj) {
  return const AlertDialog(
    title: Text('Regler for Nutids-r:'),
    content: Text(
        'Hvis det er nutid, altså noget der sker nu, så skal udsagnsordet slutte på \'r\'.\n'
            'Hvis det er navnemåde, altså noget der kan ske eller vil ske, så skal udsagnsordet ikke sluttte på \'r\'.\n\n'
            'Hint:\n'
            'Udskift eventuelt ordet med \'cykle/cykler\'. Så vil du nemmere kunne høre hvad der er rigtigt.\n\n'
            '(Tak til sproget.dk, mfl.)'),
  );
}

AlertDialog _getDobbeltk(String subj) {
  return const AlertDialog(
    title: Text('Regler for Dobbeltkonsonant:'),
    content: Text(
        'Hvis den foranstående vokal er kort og trykstærk, skal der være dobbeltkonsonant:\n'
            'Eksempler: Bygge og hedde.\n\n'
            'Hvis den foranstående vokal er lang, skal der være enkelt konsonant:\n'
            'Eksempler: Byge og hede.\n\n'
            'Hint:\n'
            'Flere konsonanter har særregler, så brug din Retskrivningsordbog hvis du er i tvivl.\n\n'
            '(Tak til sproget.dk, mfl.)'),
  );
}

AlertDialog _getStumme(String subj) {
  return const AlertDialog(
    title: Text('Regler for Stumme bogstaver:'),
    content: Text(
        'Hovedreglen er at et stumt \'H\' findes i begyndelsen af et ord, og et stumt \'D\' findes i slutningen af et ord:\n'
            'Eksempler: Hvem, hvor og hjul.\n'
            'Eksempler: Jord, bord og blind.\n\n'
            'Hint:\n'
            'Der er ingen klare regler for stumme bogstaver, så du må lære dem udenad. \'G\' kan også være stumt, fx i Stige og Lige.\n\n'
            '(Tak til sproget.dk, mfl.)'),
  );
}

AlertDialog _getLigge(String subj) {
  return const AlertDialog(
    title: Text('Regler for Ligge og Lægge:'),
    content: Text(
        'Man bruger \'lægge\' hvis det er en bevægelse:\n'
            'Eksempel (bevægelse):\nJeg lægger mig ned.\n\n'
            'Man bruger \'ligge\' hvis det er noget der ligger stille:\n'
            'Eksempel (stille):\nNu ligger jeg ned.\n\n'
            'Hint:\n'
            'Ønsker du en grammatisk forklaring, kan du få den på sproget.dk.\n\n'
            '(Tak til sproget.dk, mfl.)'),
  );
}

AlertDialog _getEneEnde(String subj) {
  return const AlertDialog(
    title: Text('Regler for -ene og -ende:'),
    content: Text(
        'Navneord slutter på -ene:\n'
            'Eksempler:\nJeg vandt alle løbene.\nHan hørte skrigene.\n\n'
            'Udsagnsord slutter på -ende.\n'
            'Eksempler:\nHun kom løbende.\nJeg løb skrigende rundt.\n\n'
            'Hint:\n'
            'Tillægsord (fx bedrevidende) slutter altid på -ende.\n\n'
            '(Tak til sproget.dk, mfl.)'),
  );
}

AlertDialog _getAdAf(String subj) {
  return const AlertDialog(
    title: Text('Regler for Ad og Af:'),
    content: Text(
        'Af = væk fra noget, når der sker noget:\n'
            'Eksempler:\nJeg tog huen af.\nBladene faldt af træerne.\n\n'
            'Ad = langs med, hen over eller gennem noget:\n'
            'Eksempler:\nJeg kiggede ud ad vinduet.\nPigerne gik hen ad gaden.\n\n'
            'Hint:\n'
            'Der findes faste udtryk med ad, og andre udtryk hvor ad/af er valgfrit. Se sproget.dk.\n\n'
            '(Tak til sproget.dk, mfl.)'),
  );
}

AlertDialog _getNogen(String subj) {
  return const AlertDialog(
    title: Text('Regler Nogen og Nogle:'),
    content: Text(
        'Nogen betyder \'Nogen som helst\' og bruges især i:\n'
            'Nægtende sætninger:\nDe fandt ikke nogen hjemme.\n'
            'Spørgsmål:\nEr der nogen hjemme?\n'
            'Betingede sætninger:\nHvis der er nogen hjemme, så...\n\n'
            'Nogle betyder \'et par\' eller andre udtryk for enkelte personer/ting.\n'
            'De så nogle gamle film.\n\n'
            'Hint:\n'
            'Nogen svarer til det engelske ord \'any\', og nogle svarer til \'some\'.\n\n'
            '(Tak til sproget.dk, mfl.)'),
  );
}
