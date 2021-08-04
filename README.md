# excellent

excellent - **ex**am **cell**s cont**ent** analyzer

A tiny program for analyzing exam passing results.

## Building

```
swift build --product excellent
```

## Running

```sh
./.build/debug/excellent trace-marks Ива
```

Results:

```sh
Fetching data for user Ива...
Иванов И.И. Priority: 1; Rank: 1; Specialization mark: -; Foreign language mark: 5; Individual mark: 5
Иванов И.И. Priority: 2; Rank: -; Specialization mark: 5; Foreign language mark: 5; Individual mark: 17
```