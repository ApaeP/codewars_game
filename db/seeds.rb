puts "Seeding"

puts "\nDestroy records"
  Friendship.destroy_all
  Solution.destroy_all
  Kata.destroy_all
  User.destroy_all
puts "Records destroyed"

puts "\nCreate records"

puts "\nCreate users"
  User.create!(
    email: 'test@test.com',
    password: 'azerty',
    codewars_nickname: ENV['CODEWARS_NICKNAME'],
    codewars_email: ENV['CODEWARS_EMAIL'],
    codewars_password: ENV['CODEWARS_PASSWORD'],
    codewars_api_token: ENV['CODEWARS_API_TOKEN']
  )
  %W(Lomig Wulfens).each_with_index do |user, i|
    User.create!(
      email: "test#{i}@test.com",
      password: 'azerty',
      codewars_nickname: user,
      codewars_email: ENV['codewars_email'],
      codewars_password: ENV['codewars_password'],
      codewars_api_token: ENV['CODEWARS_API_TOKEN']
    )
  end
puts "Created users"

puts "\nCreate katas"
  Kata.create! [{
    codewars_id: "546e2562b03326a88e000020",
    url: "https://www.codewars.com/kata/546e2562b03326a88e000020",
    title: "Square Every Digit",
    level: -7,
    level_name: "7 kyu",
    level_color: "white",
    tags: ["Fundamentals", "Mathematics", "Algorithms", "Logic", "Numbers"],
    category: "reference",
    languages: ["python", "java", "javascript", "ruby", "haskell", "csharp", "crystal", "typescript", "elm", "julia", "prolog", "swift"],
    vote_score: 11980,
    total_stars: 1170,
    description: "Welcome. In this kata, you are asked to square every digit of a number and concatenate them.\n\nFor example, if we run 9119 through the function, 811181 will come out, because 9<sup>2</sup> is 81 and 1<sup>2</sup> is 1.\n\n**Note:** The function accepts an integer and returns an integer\n",
    total_attempts: 444586,
    total_completed: 127715,
  },{
    codewars_id: "546f922b54af40e1e90001da",
    url: "https://www.codewars.com/kata/546f922b54af40e1e90001da",
    title: "Replace With Alphabet Position",
    level: -6,
    level_name: "6 kyu",
    level_color: "yellow",
    tags: ["Fundamentals", "Strings", "Data Types"],
    category: "reference",
    languages: ["python", "javascript", "csharp", "php", "c", "ruby", "rust", "scala", "nasm", "groovy"],
    vote_score: 8841,
    total_stars: 1767,
    description: "Welcome.\n\nIn this kata you are required to, given a string, replace every letter with its position in the alphabet.\n\nIf anything in the text isn't a letter, ignore it and don't return it.\n\n`\"a\" = 1`, `\"b\" = 2`, etc.\n\n## Example\n\n```javascript\nalphabetPosition(\"The sunset sets at twelve o' clock.\")\n```\n```python\nalphabet_position(\"The sunset sets at twelve o' clock.\")\n```\n```ruby\nalphabet_position(\"The sunset sets at twelve o' clock.\")\n```\n```csharp\nKata.AlphabetPosition(\"The sunset sets at twelve o' clock.\")\n```\n```php\nalphabet_position('The sunset sets at twelve o\\' clock.');\n```\n```c\nalphabet_position(\"The sunset sets at twelve o' clock.\");\n```\n```nasm\ntext:  db  \"The sunset sets at twelve o' clock.\",0h0\n\nmain:\n    mov rdi, text\n    call alphabet_position\n```\n```rust\nalphabet_position(\"The sunset sets at twelve o' clock.\")\n```\n```scala\nalphabetPosition(\"The sunset sets at twelve o' clock.\")\n```\n```groovy\nKata.alphabetPosition(\"The sunset sets at twelve o' clock.\")\n```\nShould return `\"20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11\"` (as a string)",
    total_attempts: 451545,
    total_completed: 88279,
  },{
    codewars_id: "520b9d2ad5c005041100000f",
    url: "https://www.codewars.com/kata/520b9d2ad5c005041100000f",
    title: "Simple Pig Latin",
    level: -5,
    level_name: "5 kyu",
    level_color: "yellow",
    tags: ["Algorithms"],
    category: "algorithms",
    languages: ["javascript", "coffeescript", "ruby", "python", "csharp", "objc", "cpp", "java", "clojure"],
    vote_score: 4896,
    total_stars: 1085,
    description: "Move the first letter of each word to the end of it, then add \"ay\" to the end of the word. Leave punctuation marks untouched.\n\n## Examples\n\n```javascript\npigIt('Pig latin is cool'); // igPay atinlay siay oolcay\npigIt('Hello world !');     // elloHay orldway !\n```\n```objc\npigIt(@\"Pig latin is cool\"); // => @\"igPay atinlay siay oolcay\"\npigIt(@\"Hello world !\");     // => @\"elloHay orldway !\"\n```\n```ruby\npig_it('Pig latin is cool') # igPay atinlay siay oolcay\npig_it('Hello world !')     # elloHay orldway !\n```\n```python\npig_it('Pig latin is cool') # igPay atinlay siay oolcay\npig_it('Hello world !')     # elloHay orldway !\n```\n```csharp\nKata.PigIt(\"Pig latin is cool\"); // igPay atinlay siay oolcay\nKata.PigIt(\"Hello world !\");     // elloHay orldway !\n```\n```C++\npig_it(\"Pig latin is cool\");   // igPay atinlay siay oolcay\npig_it(\"Hello world !\");       // elloHay orldway\n```\n```Java\nPigLatin.pigIt('Pig latin is cool'); // igPay atinlay siay oolcay\nPigLatin.pigIt('Hello world !');     // elloHay orldway !\n```\n```clojure\n(piglatin/pig-it \"Pig latin is cool\") ; \"igPay atinlay siay oolcay\"\n(piglatin/pig-it \"Hello world !\")     ; \"elloHay orldway !\"\n```\n",
    total_attempts: 396956,
    total_completed: 70525,
  },{
    codewars_id: "552c028c030765286c00007d",
    url: "https://www.codewars.com/kata/552c028c030765286c00007d",
    title: "IQ Test",
    level: -6,
    level_name: "6 kyu",
    level_color: "yellow",
    tags: ["Fundamentals", "Logic"],
    category: "reference",
    languages: ["csharp", "javascript", "ruby", "python", "typescript", "rust"],
    vote_score: 7231,
    total_stars: 1705,
    description: "Bob is preparing to pass IQ test. The most frequent task in this test is `to find out which one of the given numbers differs from the others`. Bob observed that one number usually differs from the others in **evenness**. Help Bob — to check his answers, he needs a program that among the given numbers finds one that is different in evenness, and return a position of this number.\n\n`!` Keep in mind that your task is to help Bob solve a `real IQ test`, which means indexes of the elements start from `1 (not 0)`\n\n## Examples:\n\n```csharp\nIQ.Test(\"2 4 7 8 10\") => 3 // Third number is odd, while the rest of the numbers are even\n\nIQ.Test(\"1 2 1 1\") => 2 // Second number is even, while the rest of the numbers are odd\n```\n```javascript\niqTest(\"2 4 7 8 10\") => 3 // Third number is odd, while the rest of the numbers are even\n\niqTest(\"1 2 1 1\") => 2 // Second number is even, while the rest of the numbers are odd\n```\n```typescript\niqTest(\"2 4 7 8 10\") => 3 // Third number is odd, while the rest of the numbers are even\n\niqTest(\"1 2 1 1\") => 2 // Second number is even, while the rest of the numbers are odd\n```\n```ruby\niq_test(\"2 4 7 8 10\") => 3 # Third number is odd, while the rest of the numbers are even\n\niq_test(\"1 2 1 1\") => 2 # Second number is even, while the rest of the numbers are odd\n```\n```python\niq_test(\"2 4 7 8 10\") => 3 # Third number is odd, while the rest of the numbers are even\n\niq_test(\"1 2 1 1\") => 2 # Second number is even, while the rest of the numbers are odd\n```\n```rust\niq_test(\"2 4 7 8 10\") => 3 // Third number is odd, while the rest of the numbers are even\n\niq_test(\"1 2 1 1\") => 2 // Second number is even, while the rest of the numbers are odd\n```\n  \n",
    total_attempts: 411858,
    total_completed: 73841,
  },{
    codewars_id: "514b92a657cdc65150000006",
    url: "https://www.codewars.com/kata/514b92a657cdc65150000006",
    title: "Multiples of 3 or 5",
    level: -6,
    level_name: "6 kyu",
    level_color: "yellow",
    tags: ["Algorithms", "Mathematics", "Logic", "Numbers"],
    category: "algorithms",
    languages: ["javascript", "coffeescript", "ruby", "clojure", "python", "csharp", "java", "haskell", "cpp", "elixir", "typescript", "php", "swift", "go", "rust", "c", "r", "nim", "fsharp", "scala", "lua", "shell", "powershell", "crystal", "nasm", "julia", "kotlin", "racket", "dart", "factor", "prolog", "raku"],
    vote_score: 16308,
    total_stars: 1715,
    description: "If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.\n\nFinish the solution so that it returns the sum of all the multiples of 3 or 5 **below** the number passed in. \n\n> Note: If the number is a multiple of **both** 3 and 5, only count it *once*.\n> Also, if a number is negative, return 0(for languages that do have them)\n  \n###### *Courtesy of projecteuler.net*\n",
    total_attempts: 572204,
    total_completed: 177058,
  },{
    codewars_id: "53dbd5315a3c69eed20002dd",
    url: "https://www.codewars.com/kata/53dbd5315a3c69eed20002dd",
    title: "List Filtering",
    level: -7,
    level_name: "7 kyu",
    level_color: "white",
    tags: ["Fundamentals", "Lists", "Data Structures", "Filtering", "Algorithms", "Logic"],
    category: "reference",
    languages: ["python", "ruby", "coffeescript", "javascript", "csharp", "fsharp"],
    vote_score: 9447,
    total_stars: 725,
    description: "In this kata you will create a function that takes a list of non-negative integers and strings and returns a new list with the strings filtered out.\n\n### Example\n\n```python\nfilter_list([1,2,'a','b']) == [1,2]\nfilter_list([1,'a','b',0,15]) == [1,0,15]\nfilter_list([1,2,'aasf','1','123',123]) == [1,2,123]\n```\n```csharp\nListFilterer.GetIntegersFromList(new List<object>(){1, 2, \"a\", \"b\"}) => {1, 2}\nListFilterer.GetIntegersFromList(new List<object>(){1, 2, \"a\", \"b\", 0, 15}) => {1, 2, 0, 15}\nListFilterer.GetIntegersFromList(new List<object>(){1, 2, \"a\", \"b\", \"aasf\", \"1\", \"123\", 231}) => {1, 2, 231}\n```",
    total_attempts: 306317,
    total_completed: 103466,
  },{
    codewars_id: "54ff3102c1bad923760001f3",
    url: "https://www.codewars.com/kata/54ff3102c1bad923760001f3",
    title: "Vowel Count",
    level: -7,
    level_name: "7 kyu",
    level_color: "white",
    tags: ["Fundamentals", "Strings", "Data Types", "Utilities"],
    category: "reference",
    languages: ["java", "javascript", "python", "ruby", "haskell", "csharp", "crystal", "elixir", "php", "typescript", "r", "nasm", "julia", "kotlin", "go", "scala", "cpp", "c", "coffeescript", "rust", "dart", "prolog", "pascal"],
    vote_score: 14875,
    total_stars: 1291,
    description: "Return the number (count) of vowels in the given string. \n\nWe will consider `a, e, i, o, u` as vowels for this Kata (but not `y`).\n\nThe input string will only consist of lower case letters and/or spaces.\n",
    total_attempts: 490191,
    total_completed: 174781,
  },{
    codewars_id: "5715eaedb436cf5606000381",
    url: "https://www.codewars.com/kata/5715eaedb436cf5606000381",
    title: "Sum of positive",
    level: -8,
    level_name: "8 kyu",
    level_color: "white",
    tags: ["Fundamentals", "Arrays", "Data Types", "Numbers"],
    category: "reference",
    languages: ["javascript", "python", "ruby", "csharp", "coffeescript", "haskell", "c", "typescript", "php", "cpp", "go", "java", "elixir", "nasm", "crystal", "groovy", "scala", "kotlin", "ocaml", "swift", "rust", "racket", "julia", "powershell", "reason", "dart", "lua", "clojure", "factor"],
    vote_score: 9485,
    total_stars: 874,
    description: "You get an array of numbers, return the sum of all of the positives ones.\n\nExample `[1,-4,7,12]` => `1 + 7 + 12 = 20`\n\nNote: if there is nothing to sum, the sum is default to `0`.\n",
    total_attempts: 280646,
    total_completed: 107795,
  },{
    codewars_id: "53da3dbb4a5168369a0000fe",
    url: "https://www.codewars.com/kata/53da3dbb4a5168369a0000fe",
    title: "Even or Odd",
    level: -8,
    level_name: "8 kyu",
    level_color: "white",
    tags: ["Fundamentals", "Mathematics", "Algorithms", "Logic", "Numbers", "Data Types"],
    category: "reference",
    languages: ["python", "ruby", "clojure", "javascript", "haskell", "coffeescript", "java", "cpp", "csharp", "dart", "rust", "c", "php", "typescript", "shell", "swift", "objc", "go", "elixir", "lua", "sql", "groovy", "julia", "nasm", "scala", "kotlin", "racket", "crystal", "r", "reason", "factor", "nim", "elm", "purescript"],
    vote_score: 13177,
    total_stars: 890,
    description: "```if-not:sql\nCreate a function (or write a script in Shell) that takes an integer as an argument and returns \"Even\" for even numbers or \"Odd\" for odd numbers.\n```\n<!-- SQL Notes -->\n```if:sql\n## SQL Notes:\nYou will be given a table, `numbers`, with one column `number`.</br>\n\nReturn a table with a column `is_even` containing \"Even\" or \"Odd\" depending on `number` column values.\n\n### numbers table schema\n* number INT\n\n### output table schema\n* is_even STRING\n```\n<!-- End SQL Notes -->\n",
    total_attempts: 360850,
    total_completed: 155227,
  },{
    codewars_id: "50654ddff44f800200000004",
    url: "https://www.codewars.com/kata/50654ddff44f800200000004",
    title: "Multiply",
    level: -8,
    level_name: "8 kyu",
    level_color: "white",
    tags: ["Bugs"],
    category: "bug_fixes",
    languages: ["javascript", "coffeescript", "ruby", "python", "haskell", "clojure", "java", "csharp", "elixir", "cpp", "typescript", "php", "crystal", "dart", "rust", "fsharp", "swift", "go", "shell", "c", "lua", "sql", "bf", "r", "nim", "erlang", "objc", "scala", "kotlin", "solidity", "groovy", "fortran", "nasm", "julia", "powershell", "purescript", "elm", "ocaml", "reason", "idris", "racket", "agda", "coq", "vb", "forth", "factor", "prolog", "cfml", "lean", "cobol", "haxe", "commonlisp", "raku", "perl", "pascal"],
    vote_score: 10146,
    total_stars: 1290,
    description: "This code does not execute properly. Try to figure out why.",
    total_attempts: 4617950,
    total_completed: 3713377,
  }]
puts "Created katas"

puts "\nCreating solutions"
  User.all.each do |user|
    Kata.take(4).each do |kata|
      possible_languages = [:c, :java, :java_script, :php, :python, :ruby]
      (1..3).to_a.sample.times do |i|
        solution_language = possible_languages.delete(possible_languages.sample)
        solution_content = {
          c: "#include <stdio.h>\nint main() {\n    int num;\n    printf(\"Enter an integer: \");\n    scanf(\"%d\", &num);\n\n    // true if num is perfectly divisible by 2\n    if(num % 2 == 0)\n        printf(\"%d is even.\", num);\n    else\n        printf(\"%d is odd.\", num);\n    \n    return 0;\n}",
          java: "class Main {\n  public static void main(String[] args) {\n\n    int n = 10, firstTerm = 0, secondTerm = 1;\n    System.out.println(\"Fibonacci Series till \" + n + \" terms:\");\n\n    for (int i = 1; i <= n; ++i) {\n      System.out.print(firstTerm + \", \");\n\n      // compute the next term\n      int nextTerm = firstTerm + secondTerm;\n      firstTerm = secondTerm;\n      secondTerm = nextTerm;\n    }\n  }\n}",
          java_script: "const sizeUserCardElems = () => {\n  if (document.querySelector('.user-card-info')) {\n    document.querySelectorAll('.user-card-info').forEach((elem) => {\n      let childWidth = Math.round((100 / elem.childElementCount) * 100) / 100\n      let arr = Array.from(elem.children)\n      arr.forEach((child) => {\n        child.style.width = `${childWidth}%`;\n      });\n      arr[arr.length - 1].style.textAlign = 'right';\n    });\n  }\n};\n\nexport { sizeUserCardElems };\n",
          php: "function familyName($fname, $year) {\n  echo \"$fname Refsnes. Born in $year <br>\";\n}\n\nfamilyName(\"Hege\",\"1975\");\nfamilyName(\"Stale\",\"1978\");\nfamilyName(\"Kai Jim\",\"1983\");",
          python: "a = 5\nb = 6\nc = 7\n\n# Uncomment below to take inputs from the user\n# a = float(input('Enter first side: '))\n# b = float(input('Enter second side: '))\n# c = float(input('Enter third side: '))\n\n# calculate the semi-perimeter\ns = (a + b + c) / 2\n\n# calculate the area\narea = (s*(s-a)*(s-b)*(s-c)) ** 0.5\nprint('The area of the triangle is %0.2f' %area)",
          ruby: "def accept_friendship\n    @friendship = Friendship.find(params[:id])\n    if @friendship.update(status: \"accepted\")\n      flash[:notice] = \"Accepted invitation from \#{@friendship.requester.full_name}\"\nelse\n  flash[:warning] = \"You suck\"\n  end"
        }[solution_language]
        Solution.create!(
          user: user,
          kata: kata,
          content: solution_content,
          language: solution_language)
      end
    end
  end
puts "Created solutions"

puts "\nCreating friendships"
  Friendship.create!(requester: User.order(:id).all[0], recipient: User.order(:id).all[1], status: "accepted")
  Friendship.create!(requester: User.order(:id).all[0], recipient: User.order(:id).all[2], status: "accepted")
puts "Created friendships"

puts "Records created"

# %w[Lomig Wulfens goldangera cbw29512 Sarah soltani marwen3216 prof_noob DolgKreker darlanmendonca dnolan jkempster34 tanzeeb pedantech gdott9 owenbyrne sdanthony Darigaaz Silberbogen Insanitariume tnelson mitjok].each_with_index do |user, i|
#   User.create!(
#     email: "test#{i}@test.com",
#     password: 'azerty',
#     codewars_nickname: user,
#     codewars_email: ENV['codewars_email'],
#     codewars_password: ENV['codewars_password'],
#     codewars_api_token: ENV['CODEWARS_API_TOKEN']
#   )
# end
