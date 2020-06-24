# a wget logfile parser and converter to json-ld
#https://stackoverflow.com/questions/27076980/parse-wget-log-file-in-python

time_and_url_pat = re.compile(r'--(\d{4}-\d{2}-\d{2}\s+\d{2}:\d{2}:\d{2})--\s+(.*)')
ip_pat = re.compile(r'Connecting to.*\|(.*?)\|')

time_and_url_list = time_and_url_pat.findall(log_lines)
print '\ntime and url\n', time_and_url_list

ip_list = ip_pat.findall(log_lines)
print '\nip\n', ip_list

all_data = [(t, u, i) for (t, u), i in zip(time_and_url_list, ip_list)]
print '\nall\n', all_data, '\n'

for t in all_data:
    print t