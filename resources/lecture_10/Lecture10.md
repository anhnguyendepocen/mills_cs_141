# Lecture 10: Review of Probability Theory

# Probability Theory, Redux

This will serve as a longer introduction to the basics of probability theory, to make sure that we have everything down before moving on. These constructs will be very important for understanding many things in the remainder of the course, so be sure to check your understanding as we go along. 

# Basic Constructs

## Probability Spaces

When we are talking about probability, we are generally trying to determine the likelihood of some **event** occurring, perhaps given some other background knowledge.

**Example:** How likely is it that is going to rain tomorrow? How likely is it that it is going to rain if it is the case that the weather forecaster predicts that it will rain?

The determination of what "likelihood" means is the subject of probability theory. Rather, the subject concerns itself with the **assignment of likelihoods to events**, where we are then tasked with defining:

* the collection of **events** to consider;
* how likelihood is assigned.

**Example:** We may be concerned with the possible outcomes of flipping a fair coin 10 times (because, say, we have a wager with someone, wherein we can win $1,000,000 if we get 10 heads in a row). The collection of events here should consist of all possible collections outcomes that can occur from flipping 10 fair coins -- e.g.

* half are heads;
* get exactly 10 tails;
* get at least 8 tails;
* the first 2 flips are tails, the rest are heads;
* etc.

To each one of these outcomes, we need to assign a likelihood of that event happening. This assignment should behave sensibly:

* the likelihood of an impossible event should be 0;
* the likelihood of a sure event should be 1 (this has to happen for other reasons);
* the likelihood of two mutually exclusive events should be the sum of their likelihoods
* etc; 

**Definition**: A **probability space** is a set $\Omega$ with collection $F \subseteq \left\{ \text{subsets of } \Omega := 2^\Omega \right\}$ called the **event space**, equipped with a **probability function** $p: F \rightarrow [0,1]$
that satisfies the following properties:

1. $p(\Omega) = 1$ (law of total probability)
2. $p(\emptyset) = 0$ (probability of an empty event is 0)
3. $p(\bigcup_i X_i) = \sum_i p(X_i)$ for any countable collection of **disjoint** subsets $X_i$ of $\Omega$ (additivity). Disjointness is to be interpreted as *mutual exclusivity*, wherein two events that are disjoint as sets are to be thought of as events that cannot occur at the same time. 

The subsets in $F$ are called **events**, the elements of $\Omega$ are called **outcomes**, and we speak of $p(X)$ as "the probability of the event $X$", for $X \in F$. 

**NB:** Not all $F \subseteq 2^\Omega$ are acceptable as event spaces -- for this to be sensible, $F$ needs to include $\Omega, \emptyset$ and should be closed under taking complements. When dealing with finite $\Omega$, we can usually take $F = 2^\Omega$, the set of all possible subsets of $\Omega$, but this doesn't work for infinite sets.

**Some nomenclature:**

There are a couple of symbols that we use:

* $\wedge$ means "and"; for events, this is represented by the set intersection $\cap$
* $\vee$ means "or"; for events, this is represented by the union $\cup$
* $\bar{X}$ or $~X$ or $\neg X$ means "not $X$"; for events this is represented by the set complement 

**Example:** Suppose we throw a (six-sided) dice. The space of possible outcomes $\Omega = \{1, 2, 3, 4, 5, 6\}$. We may decide that the events of interest is whether the dice throw is odd
or even. This event space will be given by $F = \{\emptyset, \{1, 3, 5\}, \{2, 4, 6\}, \Omega\}$

**Example:** Returning to our dice example, suppose we now take the event space F to be $2^\Omega$. Further, we define a probability distribution P over F such that
$$p({1}) = p({2}) = · · · = p({6}) = 1/6$$
then this distribution P completely specifies the probability of any given event happening
(through the additivity axiom). For example, the probability of an even dice throw will be
$$p({2, 4, 6}) = p({2}) + p({4}) + p({6}) = 1/6 + 1/6 + 1/6 = 1/2$$
since each of these events are disjoint.

**Example:** Let $\Omega$ be any finite set of size $n$. Then we can definite a probability distribution on $\Omega$ with event space $2^\Omega$ by assigning 

This suffices to define the probability of the set containing any individual outcome. This is because any subset $X \subseteq \Omega^\mathbb{N}$ is the union of some collection of individual elements which are disjoint sets. That is

$$X = \bigcup_{x \in X} \{ x\}.$$

Because our additivity axiom on $p$ requires that $p$ take a countable union of disjoint sets to sums, we can always write 

$$p(X) = p(\cup{n \in X} \{n \}) = \sum_{n \in X} p(\{ n \}) $$

We abbreviate $p(\{n\})$ as $p(n)$, to avoid writing brackets. That is, we identify $n$ with the singleton set containing $n$, $\{n\}$.

**Example:** Not all probability distributions occur where $\Omega$ is a finite set. The set of natural numbers $\mathbb{N} = \{ 0, 1, 2, \ldots\}$ is a **countable** infinite set, and there are many probability functions that we might assign to the event space $2^\mathbb{N} \simeq \mathbb{R}$.

For any of them, however, it suffices to define the probability of the set containing any individual outcome. This is because any subset $X \subseteq 2^\mathbb{N}$ is the countable union of some collection of individual natural numbers (even infinite ones) which are disjoint sets, e.g. 

* $X = \{ 2, 4, 6, 8, \dots\} = \{2\} \cup \{4\} \cup \{6\}, \dots$ (even numbers)
* $X = \{ 1, 2, 3 \} = \{1\} \cup \{2\} \{3 \}$ (a finite set)


From that perspective, any function $f: \mathbb{N} \rightarrow [0,1]$ that gives us a finite sum can be used to definte a probability distribution on $\mathbb{N}$. That is, let $f$ be a function such that $$\sum_{i=0}^\infty f(n) = K < \infty$$

Then define a probability distribution on $\mathbb{N}$ by $$p(n) = \frac{f(n)}{K}$$. This determines the distribution on $\{ n\} \subset 2^\mathbb{N}$, and we extend it by the additivity requirement. The only thing that needs to be satisfied is that $p(\Omega) = 1$, which is the calculation

$$p(\Omega) = \sum_{i=0}^\infty p(i) = \sum_{i=0}^\infty \frac{f(i)}{K} = \frac{1}{K} \sum_{i=0}^\infty f(i) = \frac{K}{K} = 1$$


**Examples:**
* $$p(n) = \frac{1}{2^{n+1}}$$
* The Poisson distribution.

**Example:** Another infinite set which has a probability measure is the interval $[0,1]$ is the underlying set for a probability space that corresponds to the normal notion of "length" that you have in $\mathbb{R}$. This is an example of a **continuous** probability space, where $\Omega$ is not just infinite, but **uncountably infinite**. The collection $F$ of events is a bit more complicated here, but it contains all of the subintervals of $[0,1]$ and assigns the probability 
$$p([a,b]) = b-a$$ 
to any subinterval $[a,b] \subseteq [0,1]$.

## Random Variables

Random variables are functions on probability spaces. The key thing to keep in mind is that this is **bad nomenclature**. Random variables are **not** variables, they are just **functions** that map outcomes to real values. 

**Definition**: A *random variable* is a real valued function on a probability space $S : \Omega \rightarrow \mathbb{R}$.

**Example:** Again, consider the process of throwing a die. Let $X$ be a random variable that
depends on the outcome of the throw. A natural choice for $X$ would be to map the outcome
$i$ to the value $i$, i.e., mapping the event of throwing an “one” to the value of 1. 

**Example:** Use the same coin flip probability space. Suppose that someone gives you \$50 for a tails and \$20 for a heads. Then this defines a random variable $S$, specified by two values: 

$$
\begin{equation}
S(H) = 20 \\
S(T) = 50
\end{equation}
$$

The most important thing is that **any random variable** defines a probability space by looking at the preimage of its values. These are called **distributions**, as they tell us how the values of the random variable are distributed over the probability space $\Omega$.

**Definition**: The *distribution of a random variable* $S$ defined on $(\Omega, p_\Omega)$ is the probability space with underlying set defined by the values of the random variable. That is, the probability associated to any subset  $X \subset 2^{\text{Values(}S)}$ is 
$$p_S (X) = p_\Omega (\omega \in \Omega \text{ with } S(\omega) \in X) = p_\Omega (S^{-1}(X)) .$$

**Example**: In the previous example, we have that the distribution for $S$ is given by 
$$p_S(X) =
\begin{cases}
.5 & \text{one of 20,50 in } X  \\
0 & \text{neither 20, 50 in } X \\
1 & \text{both 20, 50 in } X \\
\end{cases}
$$

**Example** Let a random variable $X$ be defined on the outcome space $\Omega$ of a dice throw
 If the dice is fair, then the distribution of X would be
$$P_X (1) = P_X(2) = \dots = P_X (6) = 1/6.$$

Note that this is defining a probability distribution on the **values** of the random variable, not the underlying $\Omega$. 

We can talk about a probability distribution, then, **without reference to a particular random variable**. To specify a probability distribution for a random variable is to say what the likelihood of its values occurring are -- many different random variables from many different $\Omega$ may have the same distribution!

On that note, if we have some probability space $X$ where the associated $\Omega$ is some set of possible values a random variable could attain, then we refer to this as a distribution, and any random variable that has $X$ as its associated distribution is said to be **distributed like $X$.**

**Example:** 

The **Bernoulli distribution** is a probability distribution defined on the two values $\Omega = \{0,1 \}$. For this to be a probability space, we have to assign probabilites to all subsets of $\Omega$, and because of additivity we have 

$$ 1= p(\Omega) = p(0) + p(1) $$
it must be the case that 
$$p := p(1) = 1 - p(0) $$
and so the distribution is determined by our choice of $p$, which can be any number in $[0,1]$. We write the associated distribution as $Bern(p)$. 

For a random variable $S$ to be distributed as $Bern(p)$, then, that means that $S$ takes on only values $0, 1$, and $p(S = 1) = p$. 

An example of this is the random variable $S$ where $\Omega$ is the set of individual coin flips of a fair coin and $S$ is the simple function defined by 

$$S(T) = 1 \qquad S(H) = 0$$.

Then $p(S = 1) = p(T) = .5 = p(S=0) = p(H)$, so this is distributed as $Bern(.5)$. 

### Defining Distributions

Are there easier ways to specify distributions?

Yes. They look different depending on whether the underlying $\Omega$ is **discrete** or **continuous** and whether or not the random variable takes on a continuum of values, but the basic idea.  

#### Discrete Distributions

By a discrete distribution, we mean that the random variable of the underlying distribution
can take on only finitely many different values (or that the outcome space is finite).

To define a discrete distribution, we can simply enumerate the probability of the random
variable taking on each of the possible values. This enumeration is known as the **probability mass function**, as it divides up a unit mass (the total probability) and places them on the
different values a random variable can take. This can be extended analogously to joint
distributions and conditional distributions.

**Example:**

The **Bernoulli distribution** earlier is defined by the probability mass function 

$$P(x) = p^x (1-p)^{1-x}$$

We see that $P(0) = (1-p)$ and $P(1) = p$, as we said before. This is a much more compact specification, however.

**Example:** 

The **Poisson distribution** we have seen in the homework. It is useful distribution on $\mathbb{N}$ that deals with the arrival of events.

It measures probaiblity of the number of events happening over a fixed period of time, given
a fixed average rate of occurrence, and that the events take place independently of the time
since the last event. It is parametrized by the average arrival rate $\lambda$. The probability mass function is given by:

$$ P(n) = e^{-\lambda} \frac{\lambda^n}{n!}.$$

#### Continuous Distributions

By a continuous distribution, we mean that the random variable of the underlying distribution
can take on infinitely many different values (or that the outcome space is infinite).
This is more complicated than in the discrete case, since if we place a non-zero
amount of mass on each of the values, the total mass will add up to infinity, which violates
the requirement that the total probaiblity must sum up to one.

To define continuous distributions, we use a **probability density function**, which records the "local density" of probability at a given value for the random variable, $x$. 

**Definition:** Let $S$ be a random variable. Then $S$ has a *density function* $s: \text{Values}(X) \rightarrow \mathbb{R}$ if 

$$ P_S (a \leq X \leq b) = \int_a^b s(x) dx.$$

We can think of $s(x)*dx$ as being the probability that $S$ falls in a small interval $[x, x+ dx]$, and so "adding these up" (integrating) over some collection of values gives us the total probability of those values.

Any integrable function $s(x)$ such that 

$$\int_{\text{Values}(X)} s(x) dx = 1$$ defines a probability density function. 

**Example:** 
The normal distribution is a particularly important (class of) distribution(s), which you almost certainly have seen before. It is often called a "bell curve", and the plot of its density function looks something like:

**Facts**:

1. A normal distribution is determined uniquely by two parameters:

* The **mean** $\mu$, which is the "center" of the density function;
* The **standard deviation** $\sigma$, which defines the "spread" of the normal distribution. This has the property that about 68% of the mass of the normal distribution lies in the interval $(\mu - \sigma, \mu + \sigma)$ around the mean. 

We refer to the associated normal distribution as $N(\mu, \sigma)$.

2. The normal distribution shows up in nature, mostly due to the [Central Limit Theorem](https://en.wikipedia.org/wiki/Central_limit_theorem). Roughly speaking, if we sample a large number of observations of some identical natural phenomenon in such a way that the measurements don't depend on one-another, then the average (over many repetitions of this measurement process) will be normally distributed. 

The density function associated to the standard normal distribution $N(0, 1)$ is
$$ \phi(x) = \frac{e^{-x^2/2}}{\sqrt{2\pi}}$$

The $\sqrt{2\pi}$ factor is a normalization so that the total integral is 1, and the $1/2$ factor in the exponent ensures that the standard deviation is 1. The general normal distribution $N(\mu, \sigma)$ has a density function that is obtained by translating and scaling:

$$ \phi_{\mu, \sigma} = \frac{1}{\sigma} \phi\left(\frac{x-\mu}{\sigma}\right).$$

### Expectations

**Definition**: Let $\Omega$ be a probability space and let $S$ be a random variable defined on $\Omega$. Then the **expected value** is defined as the sum

$$\mathbb{E}(S) = \sum_{\omega \in \Omega} p(\omega) \cdot S(\omega) = \int_{\Omega} S(\omega) d\omega.$$

This is the "expectation" or "average value" of $S$ over $\Omega$. We take the weighted average of the values of $\Omega$, where the weights come from the probability of obtaining the value.

**Properties:**

1. The expectation is linear. If we have two random variables, $S_1, S_2$, and constants $a_1, a_2$ then

$$ \mathbb{E}(a_1 * S_1 + a_2 * S_2) = \ a_1 \mathbb{E}(S_1) + a_2 \mathbb{E}(S_2) $$

(just think of a normal integral).

2. If $S$ has a density function $s$, then 
$$\mathbb{E}(S) = \int_{\mathbb{R}} s(x) *x \; dx.$$

3. If $S$ has a probability mass function $s$, then
$$\mathbb{E}(S) = \sum_{x \in \text{Values}(S)} s(x) * x \;$$

**Example**: 

In the coin-toss example before with $S(H) = 20, S(T) = 50$, then 

$$\mathbb{E}(S) = p(H) * s(H) + p(T) * s(T) = (.5)(20) + (.5)(50) = 10 + 25 = 35$$ 

which amounts to a $35 average payout. 

### Conditional Probability

It is often important to talk about *conditional* probability of events. 

**Definition** Let $X,Y$ be two events in $\Omega$. Then the *conditional probability of $X$ given $Y$* is given by 
$$ p(X|Y) := \frac{P(X \cap Y)}{P(Y)} = \frac{P(X \text{ and } Y)}{P(Y)}$$
Two events are called *independent* if $P(X \text{ and } Y) = P(X)*P(Y)$, in which case the above formula reduces to
$$P(X|Y) = P(X)$$, which means that "$Y$ does not effect the probability of $X$ happening".

**Example:** Let $\Omega$ represent the space of all rolls of two die. Let $Y$ be the event that the first roll is a 1, and $X$ be the event that the 2nd roll is a 1. Then $X$, $Y$ are independent, and 

**Properties:**

* If $X \subseteq Y$, $p(Y|X) = 1$.
* If $X \subseteq Y$, $p(X|Y) = p(X) / p(Y)$
* If $X, Y$ are disjoint (mutually exclusive), then $p(X | Y) = 0$. 
* $P(X \cap Y) = P(Y)(X|Y) = P(X)(Y|X)$

