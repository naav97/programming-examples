use std::collections::VecDeque;

struct Graph {
    nodes: Vec<Vec<usize>>,
}

impl Graph {
    fn new(pn: usize) -> Self {
        let mut tv: Vec<Vec<usize>> = Vec::new();
        for _i in 0..pn {
            let mut v: Vec<usize> = Vec::new();
            for _j in 0..pn {
                v.push(0);
            }
            tv.push(v);
        }
        Self {
            nodes: tv,
        }
    }
    fn add_edge(&mut self, ini: usize, fin: usize, peso: usize) {
        self.nodes[ini][fin] = peso;
    }
    fn print_graph(&self) {
        for i in 0..self.nodes.len() {
            print!("({})",i);
            for j in 0..self.nodes.len() {
                if self.nodes[i][j] > 0 {
                    print!(" -{}> {}", self.nodes[i][j], j);
                }
            }
            println!("");
        }
    }
    fn bellman_ford(&self, pn: usize, dist: &mut [usize]) {
        let mut fila = VecDeque::new();
        let mut procesado = vec![false;self.nodes.len()];

        fila.push_front(pn);
        dist[pn] = 0;

        while fila.len() > 0 {
            match fila.pop_front() {
                Some(act) => {
                    for j in 0..self.nodes.len() {
                        if self.nodes[act][j] > 0 {
                            if dist[act] + self.nodes[act][j] < dist[j] {
                                dist[j] = dist[act] + self.nodes[act][j];
                            }
                            if !procesado[j] {
                                fila.push_back(j);
                            }
                        }
                    }
                    procesado[act] = true;
                },
                None => (),
            }
        }
    }
}

fn main() {
    let mut g = Graph::new(5);
    g.add_edge(0, 1, 1);
    g.add_edge(0, 2, 15);
    g.add_edge(1, 3, 6);
    g.add_edge(1, 4, 2);
    g.add_edge(3, 1, 1);
    g.add_edge(3, 2, 5);
    g.add_edge(4, 3, 3);

    g.print_graph();
    let mut dist:[usize;5] = [100;5];
    g.bellman_ford(0, &mut dist);
    for d in 0..dist.len() {
        println!("De 0 a {}: {}", d, dist[d]);
    }
}
