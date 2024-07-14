const countries = [
  "Arstotzka",
  "Antegria",
  "Impor",
  "Kolechia",
  "Obristan",
  "Republia",
  "United Federation",
];

const entranceRe = /^(Allow|Deny)\scitizens\sof\s(.*?)$/;
const docsRe =
  /^(Foreigners|Citizens|Workers|Entrants)\s?o?f?\s?(.*?\s)?require\s(.*?)$/;
const vaccinationRe =
  /^(Entrants|Citizens)\s?(of|no longer)\s?(.*?\s)require\s(.*?)\svaccination$/;
const wanted = /^Wanted\sby\s?(.*?):\s(.*?)$/;

function Inspector() {
  const todayReqs = {
    countriesAllowed: [],
    countriesDenied: [],
    requiredDocuments: {},
    requiredVaccinations: {},
    wanted: [],
  };

  const arstozka = countries[0];

  const getCountries = (input, explicit = false) => {
    let cnts = [];

    if (!input.length) {
      return cnts;
    }

    if (explicit) {
      cnts = input
        .trim()
        .split(",")
        .map((x) => x.trim())
        .filter(Boolean);

      return cnts;
    }

    if (input === "Foreigners") {
      cnts = countries.filter((x) => x !== arstozka);
    } else if (input === "Citizens") {
      cnts.push(arstozka);
    } else if (input === "Entrants") {
      cnts = countries.map((x) => x);
    } else if (input === "Workers") {
      cnts = countries.map((x) => x); // @todo: probably wrong
    }

    return cnts;
  };

  return {
    receiveBulletin: function (bulletin) {
      const lines = bulletin.split("\n");
      lines.forEach(function (line) {
        if (entranceRe.test(line)) {
          const matches = line.match(entranceRe);
          const cnts = getCountries(matches[2], true);
          const action = matches[1];

          if (action === "Allow") {
            cnts.forEach((c) => {
              if (!todayReqs.countriesAllowed.includes(c)) {
                todayReqs.countriesAllowed.push(c);
              }
              if (todayReqs.countriesDenied.includes(c)) {
                todayReqs.countriesDenied = todayReqs.countriesDenied.filter(
                  (x) => x != c,
                );
              }
            });
          } else if (action === "Deny") {
            cnts.forEach((c) => {
              if (!todayReqs.countriesDenied.includes(c)) {
                todayReqs.countriesDenied.push(c);
              }
              if (todayReqs.countriesAllowed.includes(c)) {
                todayReqs.countriesAllowed = todayReqs.countriesAllowed.filter(
                  (x) => x != c,
                );
              }
            });
          }
        } else if (vaccinationRe.test(line)) {
          const matches = line.match(vaccinationRe);
          const who = matches[1];
          const rm = matches[2] == "no longer";
          let cnts = matches[3].trim();
          const vaccine = matches[4];

          cnts = getCountries(
            who === "Citizens" ? cnts : who,
            who === "Citizens",
          );

          cnts.forEach((c) => {
            if (rm) {
              todayReqs.requiredVaccinations[c] = (
                todayReqs.requiredVaccinations[c] || []
              ).filter((x) => x != c);
            } else {
              todayReqs.requiredVaccinations[c] =
                todayReqs.requiredVaccinations[c] || [];
              todayReqs.requiredVaccinations[c].push(vaccine);
            }
          });
        } else if (docsRe.test(line)) {
          const matches = line.match(docsRe);
          const who = matches[1];
          let cnts = getCountries(
            who === "Citizens" ? matches[2] : who,
            who === "Citizens",
          );
          const docs = matches[3];

          cnts.forEach((c) => {
            todayReqs.requiredDocuments[c] =
              todayReqs.requiredDocuments[c] || [];
            todayReqs.requiredDocuments[c].push(docs);
          });
        } else if (wanted.test(line)) {
          const matches = line.match(wanted);
          const name = matches[2];
          todayReqs.wanted = todayReqs.wanted || [];
          todayReqs.wanted.push(name);
        }
      });
      console.log({ todayReqs });
    },
    inspect: function (raw) {
      const documents = Object.keys(raw).map((x) => x.replace(/_/g, " "));
      const person = { documents };

      Object.keys(raw).forEach((d) => {
        const rows = raw[d].split("\n");
        person[d] = {};
        rows.forEach((r) => {
          const [key, value] = r.split(": ");
          if (key === "NATION") {
            person.nation = value;
          }
          person[d][key] = value;
        });
      });

      console.log(person);
      const docs = todayReqs.requiredDocuments[person.nation] || [];
      for (let i = 0; i < docs.length; i++) {
        if (!documents.includes(docs[i])) {
          return `Entry denied: missing required ${docs[i]}.`;
        }
      }

      dosc.push("lol");

      return person;
    },
  };
}

(function () {
  const inspector = new Inspector();
  const bulletin =
    "Entrants require passport\nAllow citizens of Arstotzka, Obristan";
  inspector.receiveBulletin(bulletin);

  const josef = {
    passport:
      "ID#: GC07D-FU8AR\nNATION: Arstotzka\nNAME: Costanza, Josef\nDOB: 1933.11.28\nSEX: M\nISS: East Grestin\nEXP: 1983.03.15",
  };
  const guyovich = {
    access_permit:
      "NAME: Guyovich, Russian\nNATION: Obristan\nID#: TE8M1-V3N7R\nPURPOSE: TRANSIT\nDURATION: 14 DAYS\nHEIGHT: 159cm\nWEIGHT: 60kg\nEXP: 1983.07.13",
  };
  const roman = {
    passport:
      "ID#: WK9XA-LKM0Q\nNATION: United Federation\nNAME: Dolanski, Roman\nDOB: 1933.01.01\nSEX: M\nISS: Shingleton\nEXP: 1983.05.12",
    grant_of_asylum:
      "NAME: Dolanski, Roman\nNATION: United Federation\nID#: Y3MNC-TPWQ2\nDOB: 1933.01.01\nHEIGHT: 176cm\nWEIGHT: 71kg\nEXP: 1983.09.20",
  };
  const entrant_tests = [
    [josef, "Josef Costanza", "Glory to Arstotzka."],
    [guyovich, "Russian Guyovich", "Entry denied: missing required passport."],
    [roman, "Roman Dolanski", "Detainment: ID number mismatch."],
  ];

  for (let [entrant, name, res] of entrant_tests) {
    const user = inspector.inspect(entrant);
    console.assert(user === res, `Expected: ${res}\nGot: ${user}`);
  }
})();
