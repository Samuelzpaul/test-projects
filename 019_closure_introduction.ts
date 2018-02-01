// function nameFunction(name: string) : void {
//   var n : string = name;

//   function printName() {
//     console.log(n);
//   }

//   printName();
// }

// nameFunction('Sam');
// ***
// function nameFunction(name: string) : void {
//   var n : string = name;

//   return function() {
//     console.log(n);
//   }
// }

// var nameAgain = nameFunction('Samuel');
// nameAgain();

// ***

function lineup() {
  var nowBatting : number = 1;

  return {
    nextBatter() { nowBatting++},
    currentBatter() { return nowBatting}
  }
}

let batters = lineup();

console.log(batters.currentBatter());
batters.nextBatter();
console.log(batters.currentBatter());
batters.nextBatter();
console.log(batters.currentBatter());

let pitchers = lineup();
console.log(pitchers.currentBatter());