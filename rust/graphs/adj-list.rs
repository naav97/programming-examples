use std::collections::VecDeque;

struct Graph {
    nodes: Vec<Vec<usize>>,
}

impl Graph {
    fn new(pn: usize) -> Self {
        let mut tv: Vec<Vec<usize>> = Vec::new();
        for _i in 0..pn {
            let temp: Vec<usize> = Vec::new();
            tv.push(temp);
        }
        Self {
            nodes: tv,
        }
    }
    fn add_edge(&mut self, ini: usize, fin: usize) {
        self.nodes[fin].push(ini);
        self.nodes[ini].push(fin);
    }
    fn print_graph(&self) {
        for (i,n) in self.nodes.iter().enumerate() {
            print!("({}) ",i);
            for t in n.iter() {
                print!("-> {}",t);
            }
            println!("");
        }
    }
    fn procesar(&self, vis: &mut Vec<bool>, pid: usize) {
        vis[pid] = true;
        print!("{} -> ", pid);
        for t in self.nodes[pid].iter() {
            if !vis[*t] {
                self.procesar(vis, *t);
            }
        }
    }
    fn dfs(&self) {
        let mut visitado: Vec<bool> = Vec::new();
        for _i in 0..self.nodes.len() {
            visitado.push(false);
        }
        self.procesar(&mut visitado, 0);
        println!("");
    }
    fn bfs(&self) {
        let mut visitado: Vec<bool> = Vec::new();
        for _i in 0..self.nodes.len() {
            visitado.push(false);
        }
        let mut line: VecDeque<usize> = VecDeque::new();
        line.push_front(0);
        visitado[0] = true;

        while line.len() > 0 {
            match line.pop_front() {
                Some(act) => {
                    print!("{:?} -> ",act);

                    for t in self.nodes[act].iter() {
                        if !visitado[*t] {
                            line.push_back(*t);
                            visitado[*t] = true;
                        }
                    }
                },
                None => (),
            }
        }
        println!("");
    }
}

fn main() {
    let mut g = Graph::new(5);
    g.add_edge(0, 1);
    g.add_edge(0, 4);
    g.add_edge(1, 2);
    g.add_edge(1, 3);
    g.add_edge(1, 4);
    g.add_edge(2, 3);
    g.add_edge(3, 4);

    g.print_graph();
    g.dfs();
    g.bfs();
}
