var txt;
var counts = {};
var keys = [];

function preload() {
  txt = loadStrings("Data/controle_de_usuarios.txt");
}

function setup() {
  var allwords = txt.join("\n");
  var tokens = allwords.split(/\W+/);

  for (var i = 0; i < tokens.length; i++) {
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
  
  function compare(a, b){
    var countA = counts[a];
    var countB = counts[b];
    return countB - countA;
  }
  
  keys.sort(compare);
  for (i = 0; i < keys.length; i++){
    var key = keys[i];
    createDiv(key + " : " + counts[key]);
  }

  noCanvas();
}
