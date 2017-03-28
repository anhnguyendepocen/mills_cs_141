
beta <- c(1,2)
alpha <- .001
f <- function(x){
  5*x[[1]] - 3*x[[2]]
}

x <- lapply(1:10, function(y) c(1, y))
y <- sapply(x, f)

grad <- function(beta){
  gradient <- c(0,0)
  for(i in 1:2){
    gradient[[i]] <- sum((sapply(x, function(p) beta %*% p) - y) * sapply(x, function(p) p[[i]]))
  }
  gradient
}
dfs <- list()
dfs2 <- list()
for(i in 1:1000){
  beta = beta - alpha * grad(beta)
  print(beta)
  ys <- c(beta %*% c(1,1), beta %*% c(1,10)) 
  if(i %% 50 == 0){
  dfs[[i]] <- data.frame(x = c(1,10), y=ys, frame = i)
  dfs2[[i]] <- data.frame(x= beta[[1]], y=beta[[2]], frame=i)
  }
}

p <- bind_rows(dfs) %>% ggplot(aes(x=x, y=y, frame=frame)) + geom_line() + geom_abline(intercept=5, slope=-3, color="red") + theme_tufte()

gganimate_save(gganimate(p), filename = "~/Desktop/loop.gif", fps=10, loop=1)

p2 <- bind_rows(dfs2) %>% ggplot(aes(x=x, y=y, frame=frame)) + geom_point() + theme_tufte()
gganimate_save(gganimate(p2), filename = "~/Desktop/loop2.gif", fps=10, loop=1)
