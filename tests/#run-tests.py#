import subprocess
import statistics
import struct
import sys
import time


def get_data_time(data):
    if len(data) < 8 or len(data) % 8 != 0:
        return None
    trange = [sys.float_info.max, sys.float_info.min]
    sz = 0
    while sz < len(data):
        word = data[sz:sz + 8]
        res = struct.unpack('Q', word)[0]
        trange[0] = min(float(res), trange[0])
        trange[1] = max(float(res), trange[1])
        sz += 8
    return trange[1] - trange[0]


def run_process(cmd):
    try:
        start = time.perf_counter_ns()
        sproc = subprocess.Popen(cmd,
                                 shell=True,
                                 stdout=subprocess.DEVNULL,
                                 stderr=subprocess.DEVNULL)
        res = sproc.communicate()
        end = time.perf_counter_ns()
        return end - start

    except:
        return None


class Benchmark():
    def __init__(self, bench_dir, cmd, libs):
        self.bench_prefix = "LD_PRELOAD=/home/zhaoxin/programs/gcc-dev/tests/libs/{} taskset -c 0 "
        #self.bench_prefix = "LD_PRELOAD=/home/noah/programs/opensource/gcc-dev/tests/libs/{} taskset -c 0 "
        self.bench_cmd = "make --silent -C {} {}".format(bench_dir, cmd)

        self.between_bench = "make --silent -C {} clean".format(bench_dir)

        self.cmd = cmd
        self.bench_dir = bench_dir

        self.libs = libs

        self.results = {}
        for lib in self.libs:
            self.results[lib] = []

    def make_bench_cmd(self, lib):
        return self.bench_prefix.format(lib) + self.bench_cmd

    def run(self):
        for lib in self.libs:
            run_cmd = self.make_bench_cmd(lib)
            print("Running: {}".format(run_cmd))
            run_process(self.between_bench)
            T = run_process(run_cmd)
            assert T is not None

            self.results[lib].append(T)

    def result(self):
        for lib in self.libs:
            print("{:<20},{:<12},{:<12},{:<16}".format(
                lib, self.bench_dir, self.cmd,
                round(statistics.geometric_mean(self.results[lib]))))


benchmarks = []

libs = [
    "libmemcpy-avx-head.so", "libmemcpy-ssse3-dev-v1.so",
    "libmemcpy-ssse3-glibc.so", "libmemcpy-sse2-head.so",
    "libmemcpy-ssse3-dev-v2.so", "libmemmove-ssse3-glibc.so"
]

for d in ["small-1", "small-10", "small-100", "small-250"]:
    for cmd in ["bench", "build", "link"]:
        benchmarks.append(Benchmark(d, cmd, libs))
for cmd in ["bench", "build", "link"]:
    benchmarks.append(Benchmark("large-file", "bench", libs))

for i in range(0, 30):
    for bench in benchmarks:
        bench.run()
    print("----------- START {} -----------".format(i))
    for bench in benchmarks:
        bench.result()
    print("----------- END {} -----------".format(i))
