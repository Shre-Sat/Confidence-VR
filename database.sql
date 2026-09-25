-- 1. Users & Profiles
CREATE TABLE users (
    user_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) UNIQUE NOT NULL,
    nickname VARCHAR(64) NOT NULL,
    age_range VARCHAR(16),
    avatar_model_url VARCHAR(255),
    comfort_level VARCHAR(32) DEFAULT 'Beginner',
    is_anonymous_mode BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. Training Scenarios Catalog
CREATE TABLE scenarios (
    scenario_id VARCHAR(64) PRIMARY KEY,
    title VARCHAR(128) NOT NULL,
    category VARCHAR(64) NOT NULL,
    target_difficulty VARCHAR(32) NOT NULL,
    environment_asset_key VARCHAR(128) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3. Practice Sessions Record
CREATE TABLE practice_sessions (
    session_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(user_id) ON DELETE CASCADE,
    scenario_id VARCHAR(64) REFERENCES scenarios(scenario_id),
    confidence_score INTEGER CHECK (confidence_score BETWEEN 0 AND 100),
    duration_seconds INTEGER NOT NULL,
    turns_count INTEGER NOT NULL,
    average_response_latency_sec NUMERIC(4,2),
    strengths TEXT[],
    focus_areas TEXT[],
    completed_at TIMESTAMPTZ DEFAULT NOW()
);

-- 4. User Gamification & Skill State
CREATE TABLE user_progress (
    user_id UUID PRIMARY KEY REFERENCES users(user_id) ON DELETE CASCADE,
    xp_points INTEGER DEFAULT 0,
    current_level INTEGER DEFAULT 1,
    current_streak_days INTEGER DEFAULT 1,
    last_practice_date DATE DEFAULT CURRENT_DATE,
    skill_coffee INTEGER DEFAULT 0,
    skill_classroom INTEGER DEFAULT 0,
    skill_interview INTEGER DEFAULT 0,
    skill_public_speaking INTEGER DEFAULT 0
);

-- 5. Achievements
CREATE TABLE achievements (
    achievement_id VARCHAR(64) PRIMARY KEY,
    name VARCHAR(128) NOT NULL,
    description TEXT NOT NULL,
    xp_reward INTEGER DEFAULT 50
);

CREATE TABLE user_achievements (
    user_id UUID REFERENCES users(user_id) ON DELETE CASCADE,
    achievement_id VARCHAR(64) REFERENCES achievements(achievement_id),
    unlocked_at TIMESTAMPTZ DEFAULT NOW(),
    PRIMARY KEY (user_id, achievement_id)
);