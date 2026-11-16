# bellabeat-data-analysis
Google Data Analytics Capstone Case Study — Bellabeat Marketing Analysis


## 1. Ask

### Business Context

Bellabeat is a health-focused technology company that develops smart wellness products for women. The company aims to identify new growth opportunities in the global smart device market.

This project is a simulated business case study completed as part of the Google Data Analytics Capstone. It does not represent actual employment or commissioned work for Bellabeat.

### Business Task

The objective of this case study is to analyze non-Bellabeat smart device usage data to identify consumer behavior trends and understand how these insights could inform Bellabeat's marketing strategy.

The analysis will examine Fitbit smart device usage data and apply the findings to a selected Bellabeat product to develop data-driven marketing recommendations.

### Business Questions

1. What are some trends in smart device usage?
2. How could these trends apply to Bellabeat customers?
3. How could these trends help influence Bellabeat's marketing strategy?

### Key Stakeholders

The following stakeholders are identified in the case study scenario:

- **Urška Sršen:** Co-founder and Chief Creative Officer of Bellabeat.
- **Sando Mur:** Co-founder and key member of the executive team.
- **Bellabeat Marketing Analytics Team:** Responsible for collecting, analyzing, and communicating data to support marketing decisions.
- **Bellabeat Executive Team:** The intended audience for the final findings and recommendations.

### Expected Outcome

The expected outcome is to identify meaningful trends in smart device usage and translate them into actionable, high-level marketing recommendations for a selected Bellabeat product.

These recommendations will be based on the available data and its limitations.


## 2. Prepare

### Data Source

The dataset used in this case study is **FitBit Fitness Tracker Data**, publicly available on Kaggle and published by Mobius.

| Attribute | Description |
|---|---|
| Dataset | FitBit Fitness Tracker Data |
| Source | [Kaggle](https://www.kaggle.com/datasets/arashnic/fitbit) |
| Publisher | Mobius |
| License | CC0 — Public Domain |
| Collection Period 1 | March 12 – April 11, 2016 |
| Collection Period 2 | April 12 – May 12, 2016 |
| Data Categories | Daily activity, steps, calories, sleep, and heart rate measurements |

The initial exploration focuses on `dailyActivity_merged.csv` and `sleepDay_merged.csv` from the second collection period (April 12 – May 12, 2016).

### Dataset Overview

| Dataset | Records | Columns | Unique Users |
|---|---:|---:|---:|
| Daily Activity | 940 | 15 | 33 |
| Sleep Data | 413 | 5 | 24 |

**Daily Activity (`dailyActivity_merged.csv`)**

Contains daily activity measurements, including steps, distances, activity intensity, active and sedentary minutes, and calories.

**Sleep Data (`sleepDay_merged.csv`)**

Contains sleep-related measurements, including total sleep records, minutes asleep, and total time in bed.

**User Coverage**

- Both datasets cover April 12 – May 12, 2016.
- All 24 users in the sleep dataset also appear in the daily activity dataset.
- Nine users in the daily activity dataset have no records in the sleep dataset.

### Data Quality & Integrity

Data quality checks were performed on the daily activity and sleep datasets to assess missing values, duplicate records, date validity, and measurement consistency.

The data exploration and quality checks are documented in [01_data_exploration.ipynb](notebooks/01_data_exploration.ipynb).

| Quality Check | Daily Activity | Sleep Data |
|---|---:|---:|
| Missing Values | 0 | 0 |
| Exact Duplicate Records | 0 | 3 |
| Duplicate User-Date Records | 0 | 3 |
| Invalid Dates | 0 | 0 |
| Negative Measurements | 0 | 0 |

Additional consistency checks found:

- **Sleep Duration:** No records where minutes asleep exceeded total time in bed.
- **Sleep Records:** No records with non-positive sleep record counts.
- **Activity Duration:** No records where total recorded activity minutes exceeded 1,440 minutes.

**Key Finding:** Three exact duplicate records were identified in the sleep dataset. These duplicates will be reviewed and handled during the Process phase.

**Participant Count Discrepancy:** The dataset documentation mentions 30 participants, while the daily activity file contains 33 unique user IDs. This discrepancy should be considered when assessing the dataset's reliability.

The checks above did not identify additional issues, but they do not guarantee that the datasets are free from all possible data quality problems.

### Data Credibility (ROCCC Assessment)

The Fitbit dataset was evaluated using the ROCCC framework to assess its credibility and suitability for the Bellabeat case study.

| Criterion | Assessment |
|---|---|
| **Reliable** | The dataset contains recorded fitness tracker measurements, but its small sample size and limited participant information restrict its representativeness. |
| **Original** | The dataset was republished on Kaggle by Möbius. Its original publication was traced to Furberg et al. (2016) on Zenodo, with data collected through an Amazon Mechanical Turk survey. The original data collection was documented, but its accuracy has not been independently verified. |
| **Comprehensive** | The dataset includes activity and sleep measurements, but sleep data is available for only 24 of the 33 users identified in the activity dataset. |
| **Current** | The data was collected in 2016 and may not reflect current smart device usage patterns. |
| **Cited** | The dataset is publicly available on Kaggle, with an identifiable publisher and a CC0 license. |

#### Licensing & Privacy

- **License:** CC0 — Public Domain, permitting reuse and redistribution.
- **Privacy:** The analysis uses publicly available fitness tracker records and does not attempt to identify individual participants.
- **Data Handling:** Raw datasets are stored locally and excluded from Git tracking.
- **Accessibility:** The dataset is publicly accessible through Kaggle.

**Overall Assessment:** The dataset is suitable for exploratory analysis of smart device usage patterns. However, its limited sample size, historical nature, and incomplete sleep coverage must be considered when interpreting findings and developing marketing recommendations.

### Data Relevance

The selected Fitbit datasets provide information about daily activity and sleep patterns, which are relevant to the business questions of this case study.

These datasets will help explore consumer behavior and identify trends that may inform marketing recommendations for a selected Bellabeat product.


