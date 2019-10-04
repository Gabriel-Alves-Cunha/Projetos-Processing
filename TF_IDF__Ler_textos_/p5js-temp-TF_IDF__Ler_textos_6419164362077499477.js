var txt = [];
var counts = {};
var keys = [];
var allwords = [];

var files = ["ligando e criando paginas.txt", "principais caracteristicas.txt"];

function preload() {
  for (var i = 0; i < files.length; i++) {
    txt[i] = loadStrings("Data\\"+files[i]);
  }
}

function setup() {
  for (var i = 0; i < files.length; i++) {
    allwords[i] = txt[i].join("\n");
  }

  var tokens = allwords[0].split(/\W+/);

  for (i = 0; i < tokens.length; i++) {
    var word = tokens[i].toLowerCase();

    if (!(/\d+/.test(word))) {
      if (counts[word] === undefined) {
        counts[word] = 1;
        keys.push(word);
      } else {
        counts[word] += 1;
      }
    }
  }

  function compare(a, b) {
    var countA = counts[a];
    var countB = counts[b];
    return countB - countA;
  }

  keys.sort(compare);
  for (i = 0; i < keys.length; i++) {
    var key = keys[i];
    createDiv(key + " : " + counts[key]);
  }

  noCanvas();
}
