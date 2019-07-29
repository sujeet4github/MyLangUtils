// firstly attach an event-listener to the form that fires when user submits the quiz
const form = document.querySelector(".quiz-form")
const result = document.querySelector(".result");

form.addEventListener('submit', e => {

    // this prevents the default action of submit event - i.e. refreshing the page...
    e.preventDefault();

    const userAnswers = [form.q1.value, form.q2.value, form.q3.value, form.q4.value];

    // Store answers in an array of strings...
    const correctAnswers = ['B', 'B', 'B', 'B'];

    const results = userAnswers
                        .map( (answer, index) => answer === correctAnswers[index])
                        .filter( x => x )
                        .length;
    const resultsAsPercent = results * 100 / correctAnswers.length;
    // console.log(resultsAsPercent);

    result.classList.remove("d-none")
    // console.log(result);    

    const percentDisplay = result.querySelector(".text-primary");

    scrollTo(0,0);
    let score = 0;
    const timer = setInterval(() => {
        percentDisplay.textContent = `${score}%`;
        score++;
        if (score > resultsAsPercent) {
            clearInterval(timer);
        }
    }, 10);
    // percentDisplay.textContent = `${resultsAsPercent}%`;
});


