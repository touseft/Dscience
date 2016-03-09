#!/usr/local/bin/tcsh

cd $1

cat */s*/reports/sort/*.txt > setup_report.txt
cat */h*/reports/sort/*.txt > hold_report.txt

/usr/local/scripts/bin/search.pl -s "data arrival time" setup_report.txt -b 1 | grep -v "data arrival" | grep -v "data require" > setup_endpoint.txt
/usr/local/scripts/bin/search.pl -s "data required time" setup_report.txt -a 3 | grep "slack" > setup_endpoint_slack.txt

/usr/local/scripts/bin/search.pl -s "data arrival time" hold_report.txt -b 1 | grep -v "data arrival" | grep -v "data require" > hold_endpoint.txt
/usr/local/scripts/bin/search.pl -s "data required time" hold_report.txt -a 3 | grep "slack" > hold_endpoint_slack.txt

/home/tousef/myperl/release/merge_slack.pl setup_endpoint.txt setup_endpoint_slack.txt  | grep VIOLATED | sort > setup_slack_summary.txt
/home/tousef/myperl/release/merge_slack.pl hold_endpoint.txt hold_endpoint_slack.txt  | grep VIOLATED | sort > hold_slack_summary.txt

/home/tousef/myperl/release/merge_uniquify.pl < setup_slack_summary.txt | sort -u | sort +1n > setup_slack_summary_unique.txt
/home/tousef/myperl/release/merge_uniquify.pl < hold_slack_summary.txt | sort -u | sort +1n > hold_slack_summary_unique.txt

rm setup_report.txt
rm hold_report.txt
rm setup_endpoint.txt
rm setup_endpoint_slack.txt
rm hold_endpoint.txt
rm hold_endpoint_slack.txt
rm setup_slack_summary.txt
rm hold_slack_summary.txt

