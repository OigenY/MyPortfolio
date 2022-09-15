const quoteText = document.querySelector(".quote"),
    authorName = document.querySelector(".author .name"),
    quoteBtn = document.querySelector(".NewQuote"),
    soundBtn = document.querySelector(".sound"),
    copyBtn = document.querySelector(".copy"),
    twitterBtn = document.querySelector(".twitter");

//random quote function
function randomQuote() {
    quoteBtn.classList.add("loading");
    quoteBtn.innerText = "Loading...";
    //fetching data from API and parsing it into js object 
    fetch("https://api.quotable.io/random").then(res => res.json()).then(result => {
        quoteText.innerText = result.content;
        authorName.innerText = result.author;
        quoteBtn.innerText = "New Quote";
        quoteBtn.classList.remove("loading");
    });
}

soundBtn.addEventListener("click", () => {
    //SpeechSynthesisUtterance is a web speech api
    let utterance = new SpeechSynthesisUtterance(`${quoteText.innerText} by ${authorName.innerText}`);
    speechSynthesis.speak(utterance); //speak method of speechSynthesis speaks the utterance
});

copyBtn.addEventListener("click", () => {
    //copying the quote on copyBtn click
    //writeText is the property that specified text string to the system clipboard
    navigator.clipboard.writeText(quoteText.innerText);
});

twitterBtn.addEventListener("click", () => {
    let twitterUrl = `https://twitter.com/intent/tweet?url=${quoteText.innerText}`;
    window.open(twitterUrl, "_blank");
});


quoteBtn.addEventListener("click", randomQuote);